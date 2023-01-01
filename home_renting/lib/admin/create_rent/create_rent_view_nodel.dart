import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/home_model.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateRentViewModel extends BasedViewModel {
  final FireStoreService _firestoreService = locator<FireStoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  HomeModel? _editProperty;
  void setEditIngProperty(HomeModel property) {
    _editProperty = property;
  }

  bool get _editting => _editProperty != null;

  final log = getLogger("CreateRentViewModel");
  final List<String> _categories = [
    "All",
    "Self Contain",
    "One Bedroom Flat",
    "Two Bedroom Flat",
    "Duplex",
    "WareHouse",
    "Office Space",
    "Shop",
  ];
  final List<String> _isAvailable = ["yes", "no"];
  List<String> get categories => _categories;

  List<String> get isAvailable => _isAvailable;

  String selectRole = "Shop";

  String selectedAvailability = "yes";

  void selectedAvailabilty(String availabilty) {
    selectedAvailability = availabilty;
    log.v(selectedAvailability);
    notifyListeners();
  }

  void selectedRole(String role) {
    selectRole = role;
    log.v(selectRole);
    notifyListeners();
  }

  Future addProperty({
    required String name,
    required location,
    required owner,
    required String address,
    required String price,
    required String numberOfBathroom,
    required String numberOfBedrooms,
    required String description,
  }) async {
    final dynamic  response;
    setBusy(true);
    if (!_editting) {
     response = await _firestoreService.addRent(HomeModel(
        id: currentUser.id,
        name: name,
        type: selectRole,
        location: location,
        owner: currentUser.fullname,
        isAvalable: selectedAvailability,
        address: address,
        price: price,
        numberOfBedrooms: numberOfBedrooms,
        numberOfBathroom: numberOfBathroom,
        description: description,
      ));
    } else {
     response = await _firestoreService.updateProperty(HomeModel(
        id: _editProperty!.id,
        name: name,
        type: selectRole,
        location: location,
        owner: currentUser.fullname,
        isAvalable: selectedAvailability,
        address: address,
        price: price,
        numberOfBedrooms: numberOfBedrooms,
        numberOfBathroom: numberOfBathroom,
        description: description,
        docId: _editProperty!.docId,
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
        title: "Property Added Succesfully",
        description: "Your Property Has Been Created",
      );
    }
    _navigationService.popRepeated(1);
  }
}
