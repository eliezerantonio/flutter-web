import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';

class AuthLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
//Desktop
        _DesktopBody()

//Mobile

//LinksBar
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height,
        color: Colors.red,
        child: Row(
          children: [
            //Twiter background
            BackgroundTwitter(),
            //View container background
            Container(
              width: 600,
              height: double.infinity,
              color: Colors.black,
            )
          ],
        ));
  }
}
