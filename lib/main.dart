import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skynet/login/login_page.dart';
import 'package:skynet/profile/profile_page.dart';
import 'package:skynet/support/support_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_state.dart';
import 'package:skynet/recharge/recharge_page.dart';
import 'package:skynet/theme.dart';
import 'home/home_page.dart';

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
