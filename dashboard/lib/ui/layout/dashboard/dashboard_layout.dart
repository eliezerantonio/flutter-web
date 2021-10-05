import 'package:dashboard/ui/shared/navbar.dart';
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
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                //Navbar
                Navbar(),

                //view
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
