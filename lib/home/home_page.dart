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
            height: 40,
          ),
          Container(
            height: 84 + 16 * 2,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 0.5)),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  "This month's total",
                  style: GoogleFonts.poppins(),
                ),
                Positioned(
                  top: 4,
                  child: Text(
                    '39.87',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 0.5)),
            child: Column(
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
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 0.5)),
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
