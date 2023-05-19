import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTab extends StatelessWidget {
  final String name;
  final String data;
  const DetailTab({super.key, required this.name, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(),
          ),
          Text(
            data,
            style: GoogleFonts.poppins(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
