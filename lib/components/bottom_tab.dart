import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_state.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../recharge/recharge_page.dart';
import '../support/support_page.dart';
import '../theme.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
          top: true,
          child: SizedBox(
            height: size.height - 100,
            width: size.width,
            child: IndexedStack(
              index: _selectedIndex,
              children: tabItems,
            ),
          )),
      bottomNavigationBar: AnimatedCrossFade(
        firstChild: TextButton(
          onPressed: () async {
            final Uri url = Uri.parse(
                'upi://pay?pa=jaygandhi51419@okhdfcbank&pn=SkyNet&am=${selectedPlanValue?.rate}&cu=INR');
            try {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } catch (e) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('UPI App Not Found'),
                  content: const Text(
                      'Please install an UPI app to proceed with the payment.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: Text(
                        'OK',
                        style: GoogleFonts.poppins(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.resolveWith(
                  (states) => Size(size.width, 60)),
              backgroundColor: MaterialStateColor.resolveWith((states) {
                return primaryColor;
              })),
          child: Text(
            "Pay with UPI",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        secondChild: FlashyTabBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            FocusManager.instance.primaryFocus?.unfocus();
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
