import 'package:dashboard/ui/shared/widgets/logo.dart';
import 'package:dashboard/ui/shared/widgets/menu_item.dart';
import 'package:dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 30),
          TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Analytic',
            icon: Icons.show_chart_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Customers',
            icon: Icons.people_outline,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          SizedBox(
            height: 30,
          ),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Compaign',
            icon: Icons.note_add_rounded,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () => print("dashboard"),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          colors: [
            Color(0xff092044),
            Color(0xff092042),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      );
}
