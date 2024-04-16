import 'package:sporemaster/services/authentication_service.dart';

class AuthServiceProvider {
  static final AuthenticationService _authenticationService =
      AuthenticationService();

  static AuthenticationService get authService => _authenticationService;
}
