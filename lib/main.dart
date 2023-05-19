import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skynet/profile/profile_page.dart';
import 'package:skynet/support/support_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_state.dart';
import 'package:skynet/recharge/recharge_page.dart';
import 'package:skynet/theme.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppState(
      child: MaterialApp(
        title: 'SkyNet',
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: BottomTab(),
        ),
      ),
    );
  }
}

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedIndex = 0;
  List<Widget> tabItems = [
    const HomePage(),
    const RechargePage(),
    const SupportPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    bool showPayButtonValue = AppState.of(context).shouldShowPayButton;
    Plan? selectedPlanValue = AppState.of(context).selectedPlan;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          top: true,
          child: SizedBox(
            height: size.height - 100,
            width: size.width,
            child: SingleChildScrollView(
              child: tabItems[_selectedIndex],
            ),
          )),
      bottomNavigationBar: AnimatedCrossFade(
        firstChild: InkWell(
          onTap: () async {
            final Uri url = Uri.parse(
                'upi://pay?pa=jaygandhi51419@okhdfcbank&pn=SkyNet&am=${selectedPlanValue?.rate}&cu=INR');
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Container(
            height: 70,
            width: double.infinity,
            alignment: Alignment.center,
            color: primaryColor,
            child: Text(
              "Pay with UPI",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        secondChild: FlashyTabBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          showElevation: false,
          iconSize: 24,
          animationDuration: const Duration(milliseconds: 200),
          items: [
            FlashyTabBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: primaryColor,
              inactiveColor: primaryColor.withOpacity(0.8),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.payment),
              title: const Text('Recharge'),
              activeColor: primaryColor,
              inactiveColor: primaryColor.withOpacity(0.8),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.question_answer),
              title: const Text('Support'),
              activeColor: primaryColor,
              inactiveColor: primaryColor.withOpacity(0.8),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              activeColor: primaryColor,
              inactiveColor: primaryColor.withOpacity(0.8),
            ),
          ],
        ),
        crossFadeState: showPayButtonValue
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
