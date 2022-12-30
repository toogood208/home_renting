import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/models/home_model.dart';
import 'package:home_renting/core/services/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _homeService = locator<HomeService>();
  final _navigationService = locator<NavigationService>();
  List<HomeModel> homes = [];

  HomeViewModel() {
    getHomes();
  }

  void getHomes() {
    homes = _homeService.getHomes();
    notifyListeners();
  }

  void navigateToCreateproperty() {
    _navigationService.navigateTo(Routes.createRentView);
  }

  void navigateToDetailView(HomeModel home) {
    _navigationService.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(home: home));
  }
}
