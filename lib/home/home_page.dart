import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skynet/theme.dart';

import '../components/detail_tab.dart';

class PlanDetail {
  String speed;
  String data;
  String validity;
  PlanDetail({required this.speed, required this.data, required this.validity});
}

class HomePageData {
  String dataUsage;
  PlanDetail planDetails;
  String nextRecharge;

  HomePageData(
      {required this.dataUsage,
      required this.planDetails,
      required this.nextRecharge});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  late Future<HomePageData> data;
  void getData() {
    final mockData = Future.delayed(
      const Duration(seconds: 3),
      () => HomePageData(
          dataUsage: "37.98",
          planDetails: PlanDetail(
              speed: "50Mbps", data: "Unlimited", validity: "30 Days"),
          nextRecharge: "03-Jan,23"),
    );
    final error = Future.delayed(
      const Duration(seconds: 3),
      () => throw "Some error Ocurred",
    );
    setState(() {
      data = Random().nextBool() ? mockData : error;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<HomePageData>(
            future: data,
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
                        onPressed: getData,
                        child: const Text("Try again"),
                      )
                    ],
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        'Hello',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Text(
                          'Hensi,',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 84,
                    width: double.infinity,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Text(
                          "This month's total",
                          style: GoogleFonts.poppins(),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "37.98",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'GB',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Plan details",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      const DetailTab(name: "Speed", data: "50 Mbps"),
                      const DetailTab(name: "Data", data: "Unlimited"),
                      const DetailTab(name: "Validity", data: "30 Days"),
                    ],
                  ),
                  const Divider(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Next Recharge",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "03-Jan,23",
                        style: GoogleFonts.poppins(color: Colors.black38),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
