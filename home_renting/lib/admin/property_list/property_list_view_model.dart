import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/models/home_model.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PropertyListViewModel extends BasedViewModel {
  final FireStoreService _firestoreService = locator<FireStoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final log = getLogger("PropertyListViewModel");
  List<HomeModel> _properties = [];
  List<HomeModel> get properties => _properties;

  Future fetchProperties() async {
    setBusy(true);
    final result = await _firestoreService.getPropertiesOneOff();
    setBusy(false);
    log.v(result);
    if (result is List<HomeModel>) {
      _properties = result;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
          title: "Unable to fectch post", description: result);
    }
  }

  void listenToPosts() {
    setBusy(true);
    _firestoreService.listenToPropertyRealTime().listen((properties) {
      List<HomeModel> updatedPosts = properties;
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
      setBusy(true);
      await _firestoreService.deleteProperty(_properties[index].docId!);
      setBusy(false);
    }
  }

  void naviagetToRentView() {
    _navigationService.navigateTo(Routes.createRentView);
  }

  void editPost(int index) {
    _navigationService.navigateTo(Routes.createRentView,
        arguments: CreateRentViewArguments(property: _properties[index]));
  }
}
