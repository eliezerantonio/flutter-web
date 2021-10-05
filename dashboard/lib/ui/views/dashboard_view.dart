import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Dashboard View',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
