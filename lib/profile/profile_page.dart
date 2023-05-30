import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skynet/app_state.dart';
import 'package:skynet/change_wifi_password/change_wifi_password_page.dart';
import 'package:skynet/components/button_detail_tab.dart';
import 'package:skynet/components/detail_tab.dart';

import '../authentication/authentication_controller.dart';
import '../components/dropdown_detail_tab.dart';
import '../theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final authController =
        Provider.of<AuthenticationController>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<SkyNetUser>(
            future: AppState.of(context).user,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: size.height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.error.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.red, fontSize: 18),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => primaryColor)),
                        onPressed: AppState.of(context).fetchUser,
                        child: const Text("Try again"),
                      )
                    ],
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailTab(
                      name: "Username", data: "${snapshot.data?.username}"),
                  DetailTab(name: "Name", data: "${snapshot.data?.name}"),
                  DetailTab(name: "ID", data: "${snapshot.data?.id}"),
                  DetailTab(
                      name: "Account No.", data: "${snapshot.data?.accNo}"),
                  ButtonDetailTab(
                    name: "Change Password",
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ChangeWifiPasswordPage();
                      }));
                    },
                  ),
                  DetailTab(name: "Status", data: "${snapshot.data?.status}"),
                  DropDownDetailTab(
                    name: "Address",
                    dropdownWidget: Text(
                      "${snapshot.data?.address}",
                      style: GoogleFonts.poppins(color: Colors.black38),
                    ),
                  ),
                  DetailTab(name: "Contact", data: "${snapshot.data?.contact}"),
                  DetailTab(
                      name: "Creation Date",
                      data: "${snapshot.data?.creationDate}"),
                  DetailTab(
                      name: "Renewal Date",
                      data: "${snapshot.data?.renewalDate}"),
                  DetailTab(
                      name: "Expire Date",
                      data: "${snapshot.data?.expireDate}"),
                  DropDownDetailTab(
                    name: "Plan",
                    dropdownWidget: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black12, width: 0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data?.plan.rate}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(
                            "${snapshot.data?.plan.desc}",
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
              );
            }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
