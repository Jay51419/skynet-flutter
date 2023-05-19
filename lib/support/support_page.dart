import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skynet/components/detail_tab.dart';
import 'package:skynet/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: "Write your issues here",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {},
            child: Container(
              height: 70,
              width: double.infinity,
              alignment: Alignment.center,
              color: primaryColor,
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.black26,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "You can reach us at:",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              final Uri url = Uri.parse('tel:+91 99999999');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child:
                    const DetailTab(name: "Meet Joshi", data: "+91 99999999")),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () async {
              final Uri url = Uri.parse('tel:+91 99999999');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child:
                    const DetailTab(name: "Dipen Joshi", data: "+91 99999999")),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Click the contact to initiate a call.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: Colors.black26),
            ),
          )
        ],
      ),
    );
  }
}
