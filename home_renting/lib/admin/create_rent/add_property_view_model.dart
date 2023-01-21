import 'dart:io';

import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/cloud_storage_service.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/core/services/image_selector_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class AddPropertViewModel extends BasedViewModel {
  final FireStoreService _firestoreService = locator<FireStoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelectorservice _imageSelectorService =
      locator<ImageSelectorservice>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();

  bool checkBoxValue = false;

  final log = getLogger("CreateRentViewModel");
  final List<String> _categories = [
    "Self Contain",
    "Bedroom Flat",
    "Duplex",
    "WareHouse",
    "Office Space",
  ];
  final List<String> _isAvailable = ["yes", "no"];

  Property? _editProperty;
  bool get _editting => _editProperty != null;
  List<String> get categories => _categories;
  List<String> get isAvailable => _isAvailable;
  String selectCategory = "Duplex";
  String selectedAvailability = "yes";
  File? selectedImage;
  List<File> selectedImages = [];

  void toggleCheckBoxValue(bool value) {
    checkBoxValue = value;
    notifyListeners();
    log.v(checkBoxValue);
  }

  void setEditIngProperty(Property property) {
    _editProperty = property;
  }

  void selectedAvailabilty(String availabilty) {
    selectedAvailability = availabilty;
    log.v(selectedAvailability);
    notifyListeners();
  }

  void selectedRole(String role) {
    selectCategory = role;
    log.v(selectCategory);
    notifyListeners();
  }

  Future addProperty({
    required String name,
    required location,
    required String address,
    required String price,
    required String numberOfBathroom,
    required String numberOfBedrooms,
    required String description,
  }) async {
    setBusy(true);
    final dynamic response;
    CloudStorageResult? cloudStorageResult;
    if (!_editting) {
      cloudStorageResult = await _cloudStorageService.uploadImage(
          imageToUpload: selectedImage!, title: name);
    }
    if (!_editting) {
      response = await _firestoreService.addRent(Property(
        id: currentUser.id,
        imageUrl: cloudStorageResult!.imageUrl,
        imageFilename: cloudStorageResult.imageFileName,
        name: name,
        type: selectCategory,
        location: location,
        owner: currentUser.fullname,
        isAvalable: selectedAvailability,
        address: address,
        price: price,
        numberOfBedrooms: numberOfBedrooms,
        numberOfBathroom: numberOfBathroom,
        description: description,
        showInTopRents: checkBoxValue,
      ));
    } else {
      response = await _firestoreService.updateProperty(Property(
        id: _editProperty!.id,
        name: name,
        imageUrl: _editProperty!.imageUrl,
        imageFilename: _editProperty!.imageFilename,
        type: selectCategory,
        location: location,
        owner: currentUser.fullname,
        isAvalable: selectedAvailability,
        address: address,
        price: price,
        numberOfBedrooms: numberOfBedrooms,
        numberOfBathroom: numberOfBathroom,
        description: description,
        docId: _editProperty!.docId,
        showInTopRents: checkBoxValue,
      ));
    }

    setBusy(false);
    if (response is String) {
      await _dialogService.showDialog(
        title: "Could not add property",
        description: response,
      );
      log.d(response);
    } else {
      await _dialogService.showDialog(
        title: !_editting
            ? "Property Added Succesfully"
            : "Property Updated Succesfully",
        description: !_editting
            ? "Your Property Has Been Created"
            : "Your Property Has Been Updated",
      );
    }
    _navigationService.popRepeated(1);
  }

  Future selectImage() async {
    final tempImage = await _imageSelectorService.selectImage();
    final imageFile = File(tempImage!.path);
    selectedImage = imageFile;
    notifyListeners();
  }
}
