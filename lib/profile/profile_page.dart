import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skynet/change_wifi_password/change_wifi_password_page.dart';
import 'package:skynet/components/button_detail_tab.dart';
import 'package:skynet/components/detail_tab.dart';

import '../authentication/authentication_controller.dart';
import '../components/dropdown_detail_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController =
        Provider.of<AuthenticationController>(context, listen: false);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailTab(name: "Username", data: "Meet01"),
            const DetailTab(name: "Name", data: "Meet Joshi"),
            const DetailTab(name: "ID", data: "atfvevveh826b2nihb"),
            const DetailTab(name: "Account No.", data: "554444"),
            ButtonDetailTab(
              name: "Change Password",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChangeWifiPasswordPage();
                }));
              },
            ),
            const DetailTab(name: "Status", data: "Active"),
            DropDownDetailTab(
              name: "Address",
              dropdownWidget: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an",
                style: GoogleFonts.poppins(color: Colors.black38),
              ),
            ),
            const DetailTab(name: "Contact", data: "9856445699"),
            const DetailTab(name: "Creation Date", data: "20 Nov 2022"),
            const DetailTab(name: "Renewal Date", data: "20 Nov 2022"),
            const DetailTab(name: "Expire Date", data: "20 Nov 2022"),
            DropDownDetailTab(
              name: "Plan",
              dropdownWidget: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹ 1800",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "Unlimted Data @100 Mbps with 90 days Validity",
                      style: GoogleFonts.poppins(color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: TextButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  fixedSize: MaterialStateProperty.resolveWith(
                      (states) => const Size(84, 40)),
                  foregroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.red.shade200),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black12),
                ),
                onPressed: () {
                  authController.logout();
                },
                child: const Row(
                  children: [Icon(Icons.logout), Text("Logout")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
