import 'package:flutter/material.dart';
import 'package:skynet/recharge/recharge_page.dart';

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
  void updateShouldShowPayButton(bool value) {
    setState(() {
      shouldShowPayButton = value;
    });
  }

  void updateSelectedPlan(Plan? value) {
    setState(() {
      selectedPlan = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(data: this, child: widget.child);
  }
}
