import 'package:dashboard/providers/auth_provider.dart';
import 'package:dashboard/providers/sidemenu_provider.dart';
import 'package:dashboard/router/router.dart';
import 'package:dashboard/ui/views/blank_view.dart';
import 'package:dashboard/ui/views/dashboard_view.dart';
import 'package:dashboard/ui/views/icons_view.dart';
import 'package:dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    //setando a rota actual na tela
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    //setando a rota actual na tela
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      return LoginView();
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    //setando a rota actual na tela
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      return LoginView();
  });
}
