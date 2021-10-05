import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.asset("assets/user.jpeg"),
        width: 30,
        height: 30,
      ),
    );
  }
}
