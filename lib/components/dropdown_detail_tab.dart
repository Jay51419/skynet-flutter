import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownDetailTab extends StatefulWidget {
  final String name;
  final Widget dropdownWidget;

  const DropDownDetailTab(
      {super.key, required this.name, required this.dropdownWidget});

  @override
  State<DropDownDetailTab> createState() => _DropDownDetailTabState();
}

class _DropDownDetailTabState extends State<DropDownDetailTab> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.poppins(),
                ),
                isOpen
                    ? const Icon(
                        Icons.keyboard_arrow_up,
                        size: 30,
                        color: Colors.black38,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.black38,
                      )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedSize(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 200),
              child: isOpen ? widget.dropdownWidget : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
