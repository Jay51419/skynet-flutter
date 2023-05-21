import 'package:flutter/foundation.dart';

import 'authentication_service.dart';

class AuthenticationController extends ChangeNotifier {
  final AuthenticationService _authenticationService;

  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  AuthenticationController(this._authenticationService);

  Future<void> login(String email, String password) async {
    final loginSuccess = await _authenticationService.login(email, password);
    _loggedIn = loginSuccess;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authenticationService.logout();
    _loggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoggedIn() async {
    final isLoggedIn = await _authenticationService.checkLoggedIn();
    _loggedIn = isLoggedIn;
    notifyListeners();
  }
}
