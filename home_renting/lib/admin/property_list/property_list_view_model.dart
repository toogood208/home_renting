import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/cloud_storage_service.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PropertyListViewModel extends BasedViewModel {
  final FireStoreService _firestoreService = locator<FireStoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final log = getLogger("PropertyListViewModel");
  List<Property> _properties = [];
  List<Property> get properties => _properties;
  Future fetchProperties() async {
    setBusy(true);
    final result = await _firestoreService.getPropertiesOneOff();
    setBusy(false);
    log.v(result);
    if (result is List<Property>) {
      _properties = result;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
          title: "Unable to fectch post", description: result);
    }
  }

  void listenToProperty() {
    setBusy(true);
    _firestoreService.listenToPropertyRealTime().listen((properties) {
      List<Property> updatedPosts = properties;
      _properties = updatedPosts;
      notifyListeners();
      setBusy(false);
    });
  }

  Future deleteProperty(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the post?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse!.confirmed) {
      final propertyTodelete = _properties[index];
      setBusy(true);
      await _firestoreService.deleteProperty(propertyTodelete.docId!);
      await _cloudStorageService.deleteImage(propertyTodelete.docId!);
      setBusy(false);
    }
  }

  void naviagetToAddPropertyView(){
     _navigationService.navigateTo(Routes.addPropertView);
   
  }

  void naviagetToDetailPropertyView(int index){
     _navigationService.navigateTo(Routes.detailView,
      arguments: DetailViewArguments(home: _properties[index]));
   
  }

  void editProperty(int index) {
    _navigationService.navigateTo(Routes.addPropertView,
        arguments: AddPropertViewArguments(property: _properties[index]));
  }
}
