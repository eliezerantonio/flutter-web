import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton({
    Key? key,
    required this.text,
    this.color = Colors.pink,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => this.onPressed(),
      style: TextButton.styleFrom(primary: color),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(this.text),
      ),
    );
  }
}
