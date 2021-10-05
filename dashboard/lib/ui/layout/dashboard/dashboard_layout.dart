import 'package:dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //TODO:: 700px
          Sidebar(),
          //TODO:
          Expanded(child: child)
        ],
      ),
      
    );
  }
}
