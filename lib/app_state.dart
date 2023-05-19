import 'package:flutter/material.dart';
import 'package:skynet/recharge/recharge_page.dart';

enum AppStateAspect {
  shouldShowPaymentButton,
  selectedPlan,
}

class AppState extends InheritedModel<AppStateAspect> {
  final bool shouldShowPaymentButton;
  final Plan? selectedPlan;
  const AppState(
      {super.key,
      required super.child,
      required this.shouldShowPaymentButton,
      required this.selectedPlan});

  static bool? shouldShowPaymentButtonOf(BuildContext context) {
    return InheritedModel.inheritFrom<AppState>(context,
            aspect: AppStateAspect.shouldShowPaymentButton)
        ?.shouldShowPaymentButton;
  }

  static Plan? selectedPlanOf(BuildContext context) {
    return InheritedModel.inheritFrom<AppState>(context,
            aspect: AppStateAspect.selectedPlan)
        ?.selectedPlan;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return shouldShowPaymentButton != oldWidget.shouldShowPaymentButton ||
        selectedPlan != oldWidget.selectedPlan;
  }

  @override
  bool updateShouldNotifyDependent(
      AppState oldWidget, Set<AppStateAspect> dependencies) {
    if (shouldShowPaymentButton != oldWidget.shouldShowPaymentButton &&
        dependencies.contains(AppStateAspect.shouldShowPaymentButton)) {
      return true;
    }
    if (selectedPlan != oldWidget.selectedPlan &&
        dependencies.contains(AppStateAspect.selectedPlan)) {
      return true;
    }
    return false;
  }
}
