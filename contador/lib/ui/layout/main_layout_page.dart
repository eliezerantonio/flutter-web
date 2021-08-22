import 'package:contador/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppMenu(),
            Spacer(),
            //TODO:view
            Spacer()
          ],
        ),
      ),
    );
  }
}
