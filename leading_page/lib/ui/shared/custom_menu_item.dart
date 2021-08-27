import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;

  const CustomMenuItem({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 150,
          height: 50,
          color: isHover ? Colors.pinkAccent : Colors.black,
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
