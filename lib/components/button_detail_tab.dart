import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonDetailTab extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  const ButtonDetailTab({super.key, required this.name, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            const Icon(
              Icons.chevron_right,
              color: Colors.black38,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
