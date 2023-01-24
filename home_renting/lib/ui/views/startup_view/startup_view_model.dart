import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BasedViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    final hasLoggedUserIn = await _authenticationService.isUserLoggedIn();
    if (hasLoggedUserIn) {
      _navigationService.clearStackAndShow(Routes.home);
    } else {
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
