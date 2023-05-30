import 'dart:math';

import 'package:flutter/material.dart';

class _InheritedAppState extends InheritedWidget {
  final AppStateState data;
  const _InheritedAppState({
    required this.data,
    required Widget child,
  }) : super(child: child);
  @override
  bool updateShouldNotify(_InheritedAppState oldWidget) {
    return true;
  }
}

class AppState extends StatefulWidget {
  final Widget child;
  const AppState({super.key, required this.child});
  static AppStateState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedAppState>()
            as _InheritedAppState)
        .data;
  }

  @override
  State<AppState> createState() => AppStateState();
}

class AppStateState extends State<AppState> {
  bool shouldShowPayButton = false;
  Plan? selectedPlan;
  bool hasAuthenticated = false;
  Future<SkyNetUser>? user;
  void updateShouldShowPayButton(bool value) {
    setState(() {
      shouldShowPayButton = value;
    });
  }

  void updateHasAuthenticated(bool value) {
    setState(() {
      hasAuthenticated = value;
    });
  }

  void updateUser(Future<SkyNetUser> value) {
    setState(() {
      user = value;
    });
  }

  void updateSelectedPlan(Plan? value) {
    setState(() {
      selectedPlan = value;
    });
  }

  void fetchUser() {
    setState(() {
      user = Random().nextBool()
          ? Future.delayed(
              const Duration(seconds: 2),
              () => SkyNetUser(
                username: "hensi00",
                accNo: "84442144",
                address: "aaaa",
                contact: "+91 9181181189",
                creationDate: "20 Nov 2022",
                expireDate: "20 Nov 2022",
                id: "aaaaaa",
                name: "Hensi",
                plan: Plan(rate: "1800", desc: ""),
                renewalDate: "20 Nov 2022",
                status: "Active",
                dataUsage: "37.98",
              ),
            )
          : Future.error("Server error");
    });
  }

  @override
  void initState() {
    super.initState();
    if (hasAuthenticated && user != null) {
      fetchUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(data: this, child: widget.child);
  }
}

class SkyNetUser {
  String username;
  String name;
  String id;
  String accNo;
  String status;
  String address;
  String contact;
  String creationDate;
  String renewalDate;
  String expireDate;
  String dataUsage;
  Plan plan;

  SkyNetUser({
    required this.username,
    required this.accNo,
    required this.address,
    required this.contact,
    required this.creationDate,
    required this.expireDate,
    required this.id,
    required this.name,
    required this.plan,
    required this.renewalDate,
    required this.status,
    required this.dataUsage,
  });
}

class Plan {
  final String rate;
  final String desc;
  Plan({required this.rate, required this.desc});
}
