import 'package:dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinkBar extends StatefulWidget {
  const LinkBar({Key? key}) : super(key: key);

  @override
  _LinkBarState createState() => _LinkBarState();
}

class _LinkBarState extends State<LinkBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      width: double.infinity,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: "About"),
          LinkText(text: "Help Center"),
          LinkText(text: "Termos of Service"),
          LinkText(text: "Privacy Policy"),
          LinkText(text: "Cookie Policy"),
          LinkText(text: "ads info"),
          LinkText(text: "Blog"),
          LinkText(text: "Status"),
          LinkText(text: "Carrers"),
          LinkText(text: "Brand Resources"),
          LinkText(text: "Advertising"),
          LinkText(text: "Marketing"),
          LinkText(text: "Twitter for Business"),
          LinkText(text: "Developer"),
          LinkText(text: "Directory"),
          LinkText(text: "Settings"),
          LinkText(text: "@2021 Twitter, Inc"),
        ],
      ),
    );
  }
}
