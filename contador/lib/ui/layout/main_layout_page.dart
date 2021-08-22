import 'package:contador/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';

class MainLayoutPage extends StatelessWidget {
  final Widget child;

  const MainLayoutPage({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppMenu(),
            Spacer(),
            Expanded(child: child),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
