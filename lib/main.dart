import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skynet/authentication/authentication_controller.dart';
import 'package:skynet/authentication/authentication_service.dart';
import 'package:skynet/components/bottom_tab.dart';
import 'package:skynet/login/login_page.dart';
import 'app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthenticationController(AuthenticationService()),
      child: const AppState(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController =
        Provider.of<AuthenticationController>(context, listen: true);

    return MaterialApp(
      title: 'SkyNet',
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), // Animation duration
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                    scale:
                        Tween<double>(begin: 0.90, end: 1).animate(animation),
                    child: child);
              },
              child: authController.loggedIn
                  ? const BottomTab()
                  : const LoginPage()),
        ),
      ),
    );
  }
}
