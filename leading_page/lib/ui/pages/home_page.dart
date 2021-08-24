import 'package:flutter/material.dart';
import 'package:leading_page/ui/views/home_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: Container(
                width: 150,
                height: 50,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        HomeView(),
      ],
    );
  }
}
