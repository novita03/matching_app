import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagChip extends StatelessWidget {
  final String text;
  const TagChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ), // vertical tipis
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 65, 211, 206),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '#$text',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }
}
