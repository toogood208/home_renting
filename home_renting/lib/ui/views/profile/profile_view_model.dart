import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/constants/constants.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BasedViewModel {
  final FireStoreService _firestoreService = locator<FireStoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final _log = getLogger("ProfileViewModel");

  num availablePrice = 0;
  num availableLenght = 0;
  List<Property> availableList = [];

  num unAvailablePrice = 0;
  num unAvailableLenght = 0;
  List<Property> unAvailableList = [];

  String userName = "";
  String userRole = "";

  ProfileViewModel() {
    listenToProperty();
    getser();
  }
  String choice = categories[0];

  Future<void> getser() async {
   final user = _authenticationService.currentUser;
    userName = user.fullname;
    userRole = user.userRole;
    notifyListeners();
  }

  void listenToProperty() {
    setBusy(true);
    _firestoreService.listenToPropertyRealTime().listen((properties) {
      availableList = properties
          .where(
            (property) => property.isAvalable == "yes",
          )
          .toList();
      availableLenght = availableList.length;
      availableList.isEmpty
          ? availablePrice = 0
          : availablePrice = availableList
              .map((element) => int.parse(element.price))
              .toList()
              .reduce((value, element) => value + element);
      _log.v(availablePrice);

      unAvailableList = properties
          .where(
            (property) => property.isAvalable == "no",
          )
          .toList();
      unAvailableLenght = unAvailableList.length;
      unAvailableList.isEmpty
          ? unAvailablePrice = 0
          : unAvailablePrice = unAvailableList
              .map((element) => int.parse(element.price))
              .toList()
              .reduce((value, element) => value + element);
      _log.v(unAvailablePrice);
      notifyListeners();
    });

    setBusy(false);
  }

  void navigateToAboutApp() {
    _navigationService.navigateTo(Routes.aboutView);
  }

  void navigateToDetailView(Property home) {
    // _navigationService.navigateTo(Routes.detailView,
    //     arguments: DetailViewArguments(property: home));
  }
}
