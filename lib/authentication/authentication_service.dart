import 'package:skynet/authentication/token_service.dart';

class AuthenticationService {
  final tokenService = TokenService();
  Future<bool> login(String email, String password) async {
    if (email == 'admin' && password == 'admin') {
      tokenService.saveToken("idk");
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    tokenService.deleteToken();
  }

  Future<bool> checkLoggedIn() async {
    final token = await tokenService.getToken();
    return token != null;
  }
}
