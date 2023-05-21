import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skynet/login/login_page.dart';
import 'app_state.dart';

void main() {
  runApp(const AppState(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SkyNet',
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: LoginPage(),
      ),
    );
  }
}
