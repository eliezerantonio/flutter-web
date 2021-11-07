import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({Key? key, this.title, required this.child, this.width})
      : super(key: key);

  final String? title;
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: buildBoxDecoration(),
        width: width != null ? width : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null) ...[
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title!,
                  style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider()
            ],
            child,
          ],
        ));
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      );
}
