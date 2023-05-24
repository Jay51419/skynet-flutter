import 'package:skynet/authentication/token_service.dart';

class MockUser {
  final String email;
  final String password;

  MockUser(this.email, this.password);
}

class AuthenticationService {
  final tokenService = TokenService();
  List<MockUser> users = [
    MockUser("jayg5338@gmail.com", "password"),
    MockUser("jaygandhi51419@gmail.com", "password"),
  ];
  Future<bool> login(String email, String password) async {
    final List<MockUser> user = users.where((e) {
      return email == e.email;
    }).toList();

    if (user.isEmpty) {
      return Future.delayed(const Duration(seconds: 4), () {
        throw "Email doesn't exist";
      });
    } else {
      if (user[0].password != password) {
        return Future.delayed(
            const Duration(seconds: 4), () => throw "Incorrect Password");
      } else {
        tokenService.saveToken("idk");
        return Future.delayed(const Duration(seconds: 4), () => true);
      }
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
