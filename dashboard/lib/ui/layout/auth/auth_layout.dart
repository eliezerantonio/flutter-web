import 'package:flutter/material.dart';

import 'widgets/background_twitter.dart';
import 'widgets/custom_title.dart';
import 'widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  Widget child;
  AuthLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Scrollbar(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Desktop
          (size.width > 1000)
              ? _DesktopBody(child: child)
              :

              //Mobile
              _MobileBody(child: child),

          //LinksBar
          LinkBar()
        ],
      ),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTile(),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [
          //Twiter background
          Expanded(child: BackgroundTwitter()),
          //View container background
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                CustomTile(),
                SizedBox(height: 50),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}
