import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
   final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  bool passwordVisible = true;

  Future loin({required String email, required String password}) async {
    setBusy(true);

  final result = await _authenticationService.loginWithEmail(
        email: email, password: password);

    setBusy(false);
    if (result is bool) {
      navigateToHomeView();
    } else {
      await _dialogService.showDialog(
        title: "Login Failure",
        description: "general sign up problem",
      );
    }
  }

  void showPassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void navigateToSignUpView() {
    _navigationService.clearStackAndShow(Routes.signupView);
  }

   void navigateToHomeView() {
    _navigationService.clearStackAndShow(Routes.mainView);
  }
}
