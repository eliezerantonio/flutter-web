import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/providers/sidemenu_provider.dart';
import 'package:dashboard_/ui/shared/navbar_avatar.dart';
import 'package:dashboard_/ui/shared/widgets/notifications_indicator.dart';
import 'package:dashboard_/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<AuthProvider>(context).user!;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: boxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700) ...[
            IconButton(
                onPressed: () {
                  SideMenuProvider.openMenu();
                },
                icon: const Icon(Icons.menu_outlined)),
          ],
          const SizedBox(width: 5),
          //search input
          if (size.width > 390)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(
            width: 10,
          ),
          const NavbarAvatar(),
          const SizedBox(
            width: 10,
          ),
          Text("Hello ${user.nombre}"),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration() => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      );
}
