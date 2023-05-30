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

class _RechargePageState extends State<RechargePage>
    with AutomaticKeepAliveClientMixin<RechargePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool showPayButtonValue = AppState.of(context).shouldShowPayButton;
    Plan? selectedPlanValue = AppState.of(context).selectedPlan;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            for (var plan in plans)
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedPlanValue == plan) {
                          AppState.of(context).updateShouldShowPayButton(false);
                          AppState.of(context).updateSelectedPlan(null);
                        } else {
                          AppState.of(context).updateShouldShowPayButton(true);
                          AppState.of(context).updateSelectedPlan(plan);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                          color: selectedPlanValue == plan
                              ? Colors.blue.shade50
                              : Colors.white,
                          border:
                              Border.all(color: Colors.black12, width: 0.5)),
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
                    opacity:
                        showPayButtonValue && selectedPlanValue == plan ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Text(
                        "Click selection to go back.",
                        style: GoogleFonts.poppins(color: Colors.black26),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


