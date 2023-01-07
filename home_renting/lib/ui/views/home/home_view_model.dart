import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _homeService = locator<HomeService>();
  final _navigationService = locator<NavigationService>();
  List<Property> homes = [];

  HomeViewModel() {
    getHomes();
  }

  void getHomes() {
    homes = _homeService.getHomes();
    notifyListeners();
  }

  void navigateToCreateproperty() {
    _navigationService.navigateTo(Routes.propertyListView);
  }

  void navigateToDetailView(Property home) {
    _navigationService.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(property: home));
  }
}
