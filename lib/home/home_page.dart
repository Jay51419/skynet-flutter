import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skynet/theme.dart';

import '../components/detail_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
      ),
    );
  }
}
