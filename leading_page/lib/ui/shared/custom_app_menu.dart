import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 150,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              Text(
                "Menu",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Icon(
                Icons.menu,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
