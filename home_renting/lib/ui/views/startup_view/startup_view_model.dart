import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:home_renting/core/services/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SharedPreferencesService _localStorage =
      locator<SharedPreferencesService>();

  Future handleStartUpLogic() async {
    final hasLoggedUserIn = await _authenticationService.isUserLoggedIn();
    final onboardingDone = await _localStorage.getData("onboard");
    await Future.delayed(const Duration(seconds: 3), () {
      if (hasLoggedUserIn) {
        _navigationService.clearStackAndShow(Routes.mainView);
      } else if (onboardingDone == null) {
        _navigationService.clearStackAndShow(Routes.onBoardingView);
      } else {
        _navigationService.clearStackAndShow(Routes.loginView);
      }
    });
  }
}
