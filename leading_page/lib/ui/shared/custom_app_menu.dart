import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leading_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTile(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(text: 'Home', onPressed: () {}),
                CustomMenuItem(text: 'About', onPressed: () {}),
                CustomMenuItem(text: 'Pricing', onPressed: () {}),
                CustomMenuItem(text: 'Contact', onPressed: () {}),
                CustomMenuItem(text: 'Location', onPressed: () {}),
                SizedBox(height: 8)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            "Menu",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            color: Colors.white,
            progress: controller,
          )
        ],
      ),
    );
  }
}
