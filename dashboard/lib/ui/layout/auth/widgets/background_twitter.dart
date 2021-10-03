import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/twitter-bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        constraints: BoxConstraints(maxWidth: 400),
        child: Center(
          child: Image(
            image: AssetImage("assets/twitter-white-logo.png"),
            width: 400,
          ),
        ),
      ),
    );
  }
}
