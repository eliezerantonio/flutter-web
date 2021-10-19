import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  const TextSeparator({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
