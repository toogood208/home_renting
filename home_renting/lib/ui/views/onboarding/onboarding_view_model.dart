import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/services/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel{
 final _navigation = locator<NavigationService>();
 final _preferences = locator<SharedPreferencesService>();
  final log = getLogger("OnboardingViewModel");

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    log.v(currentIndex);
    notifyListeners();
  }

  void navigateToSignUp() {
   _navigation.replaceWith(Routes.signupView);
   _preferences.saveData("onboard", true);
  }
}