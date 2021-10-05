import 'package:dashboard/ui/shared/navbar_avatar.dart';
import 'package:dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: boxDecoration(),
      child: Row(
        children: [
//TODO: hamburguer icon
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
          SizedBox(width: 5),

          //search input
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          ),
          Spacer(),
          NotificationsIndicator(),
          SizedBox(
            width: 10,
          ),
          NavbarAvatar(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration() => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      );
}
