import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class ChangeWifiPasswordPage extends StatefulWidget {
  const ChangeWifiPasswordPage({super.key});

  @override
  State<ChangeWifiPasswordPage> createState() => _ChangeWifiPasswordPageState();
}

class _ChangeWifiPasswordPageState extends State<ChangeWifiPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  String passwordText = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black38,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enter your New Password:",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      error,
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      setState(() {
                        passwordText = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.resolveWith(
                            (states) => Size(size.width, 60)),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) {
                          return primaryColor;
                        })),
                    onPressed: () {
                      setState(() {
                        if (passwordText.length <= 8) {
                          error =
                              "Password must be at least 8 characters long.";
                        } else {
                          error = "";
                        }
                      });
                      print(error);
                      print(passwordText);
                    },
                    child: Text(
                      "Apply for changes",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
