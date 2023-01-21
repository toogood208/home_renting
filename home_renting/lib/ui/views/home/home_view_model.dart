import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/firestore_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final FireStoreService _firestoreService = locator<FireStoreService>();

  List<Property> _properties = [];
  List<Property> get properties => _properties;

  List<Property> _topRents = [];
  List<Property> get topRents => _topRents;

  List<Property> homes = [];

  HomeViewModel() {
    listenToProperty();
  }

  void listenToProperty() {
    setBusy(true);
    _firestoreService.listenToPropertyRealTime().listen((properties) {
      List<Property> updatedPosts = properties;
      _properties = updatedPosts;
      _topRents = updatedPosts.where((property) => property.showInTopRents == true ,).toList();
      notifyListeners();
      setBusy(false);
    });
  }

  void navigateToCreateproperty() {
    _navigationService.navigateTo(Routes.propertyListView);
  }

  void navigateToDetailView(Property home) {
    _navigationService.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(property: home));
  }
}
