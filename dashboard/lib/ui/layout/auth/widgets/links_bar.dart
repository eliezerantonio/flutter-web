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
      height: (size.width > 1000) ? size.height * 0.07 : null,
      width: double.infinity,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: "About",
            onPressed: () {},
          ),
          LinkText(text: "Help Center", onPressed: () {}),
          LinkText(text: "Termos of Service", onPressed: () {}),
          LinkText(text: "Privacy Policy", onPressed: () {}),
          LinkText(text: "Cookie Policy", onPressed: () {}),
          LinkText(text: "ads info", onPressed: () {}),
          LinkText(text: "Blog", onPressed: () {}),
          LinkText(text: "Status", onPressed: () {}),
          LinkText(text: "Carrers", onPressed: () {}),
          LinkText(text: "Brand Resources", onPressed: () {}),
          LinkText(text: "Advertising", onPressed: () {}),
          LinkText(text: "Marketing", onPressed: () {}),
          LinkText(text: "Twitter for Business", onPressed: () {}),
          LinkText(text: "Developer", onPressed: () {}),
          LinkText(text: "Directory", onPressed: () {}),
          LinkText(text: "Settings", onPressed: () {}),
          LinkText(text: "@2021 Twitter, Inc", onPressed: () {}),
        ],
      ),
    );
  }
}
