import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_state.dart';

List<Plan> plans = [
  Plan(rate: "1800", desc: "Unlimted Data @100 Mbps with 90 days Validity"),
  Plan(rate: "2400", desc: "Unlimted Data @100 Mbps with 90 days Validity"),
  Plan(rate: "4000", desc: "Unlimted Data @100 Mbps with 90 days Validity"),
  Plan(rate: "7000", desc: "Unlimted Data @100 Mbps with 90 days Validity"),
];

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    bool showPayButtonValue = AppState.shouldShowPaymentButtonOf(context)!;
    Plan? selectedPlanValue = AppState.selectedPlanOf(context);

    return Column(
      children: [
        for (var plan in plans)
          GestureDetector(
            onTap: () {
              setState(() {
                if (selectedPlanValue == plan) {
                  showPayButtonValue = false;
                  selectedPlanValue = null;
                } else {
                  showPayButtonValue = true;
                  selectedPlanValue = plan;
                }
              });
            },
            child: AnimatedContainer(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: selectedPlanValue == plan
                      ? Colors.blue.shade50
                      : Colors.white,
                  border: Border.all(color: Colors.black12, width: 0.5)),
              duration: const Duration(milliseconds: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹ ${plan.rate}",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    plan.desc,
                    style: GoogleFonts.poppins(color: Colors.black38),
                  ),
                ],
              ),
            ),
          ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: showPayButtonValue ? 1 : 0,
          child: Text(
            "Click selection to go back.",
            style: GoogleFonts.poppins(color: Colors.black26),
          ),
        )
      ],
    );
  }
}

class Plan {
  final String rate;
  final String desc;
  Plan({required this.rate, required this.desc});
}
