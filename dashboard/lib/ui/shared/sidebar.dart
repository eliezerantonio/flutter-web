import 'package:dashboard/providers/sidemenu_provider.dart';
import 'package:dashboard/router/router.dart';
import 'package:dashboard/services/navigation_service.dart';
import 'package:dashboard/ui/shared/widgets/logo.dart';
import 'package:dashboard/ui/shared/widgets/menu_item.dart';
import 'package:dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.nivigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
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
            isActive:
                sideMenuProvider.currrentPage == Flurorouter.dashboardRoute,
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () {
              navigateTo(Flurorouter.dashboardRoute);
            },
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
            isActive: sideMenuProvider.currrentPage == Flurorouter.iconsRoute,
            icon: Icons.list_alt_outlined,
            onPressed: () {
              navigateTo(Flurorouter.iconsRoute);
            },
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
            text: 'Blank',
            icon: Icons.post_add_outlined,
            isActive: sideMenuProvider.currrentPage == Flurorouter.blankRoute,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
          ),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'Exit'),
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
