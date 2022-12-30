import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/core/models/user.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class BasedViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  UserModel get currentUser => _authenticationService.currentUser;
}
