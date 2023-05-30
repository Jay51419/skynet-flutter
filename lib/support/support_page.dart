import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skynet/components/detail_tab.dart';
import 'package:skynet/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>
    with AutomaticKeepAliveClientMixin<SupportPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
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
            TextButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.resolveWith(
                      (states) => Size(size.width, 60)),
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    return primaryColor;
                  })),
              onPressed: () {},
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: Colors.white),
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
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const DetailTab(
                      name: "Meet Joshi", data: "+91 99999999")),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse('tel:+91 99999999');
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const DetailTab(
                      name: "Dipen Joshi", data: "+91 99999999")),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
