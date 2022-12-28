import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  String selectRole = "user";

  void selectedRole(String role) {
    selectRole = role;
    notifyListeners();
  }

  Future signUp({required String email, required String password}) async {
    setBusy(true);

    final user = await _authenticationService.signupWithEmail(
        email: email, password: password);

    setBusy(false);
    if (user != null) {
      navigateToHomeView();
    } else {
      await _dialogService.showDialog(
        title: "Signup Failure",
        description: "general sign up problem",
      );
    }
  }

  bool passwordVisible = true;
  bool confirmPasswordVissble = true;

  void showPassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void showConfirmPassword() {
    confirmPasswordVissble = !confirmPasswordVissble;
    notifyListeners();
  }

  void navigateToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void navigateToHomeView() {
    _navigationService.clearStackAndShow(Routes.home);
  }
}
