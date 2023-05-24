import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../authentication/authentication_controller.dart';
import '../theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(
    text: "",
  );
  TextEditingController passwordController = TextEditingController(
    text: "",
  );
  bool loading = false;
  String error = "";
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authController =
        Provider.of<AuthenticationController>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/logo.png",
                height: 170,
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  error,
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: emailError,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  errorText: passwordError,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot your password?")),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.resolveWith(
                          (states) => Size(size.width, 60)),
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                        if (loading) {
                          return Colors.black12;
                        }
                        return primaryColor;
                      })),
                  onPressed: () async {
                    final emailRegex = RegExp(
                        r"^(?!\s*$)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$");
                    final passwordRegex = RegExp(r"^.+$");
                    setState(() {
                      error = "";
                    });
                    if (emailRegex.hasMatch(emailController.text)) {
                      setState(() {
                        emailError = null;
                      });
                      if (passwordRegex.hasMatch(passwordController.text)) {
                        setState(() {
                          passwordError = null;
                          loading = true;
                        });
                        await authController
                            .login(
                                emailController.text, passwordController.text)
                            .whenComplete(() {
                          setState(() {
                            loading = false;
                          });
                        }).catchError(
                          (err, stackTrace) {
                            setState(() {
                              error = err.toString();
                            });
                          },
                        );
                      } else {
                        setState(() {
                          passwordError = "Enter password";
                          loading = false;
                        });
                      }
                    } else {
                      setState(() {
                        emailError = "Enter a valid email";
                        loading = false;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: loading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: primaryColor,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  )),
            ]),
          ),
        ),
      )),
    );
  }
}
