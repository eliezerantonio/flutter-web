import 'package:dashboard/router/admin_handlers.dart';
import 'package:dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  //Auth Router f
  static String rootRoute = "/";
  static String loginRoute = "/auth/login";
  static String registerRoute = "/auth/register";

  //Dashboard Router
  static String dashboardRoute = "/dashboard";

  static void configureRoutes() {
    //Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    // router.define(registerRoute, handler: handler)

    //404 Router

    router.notFoundHandler = NoPageFoundHandler.noPageFound;
  }
}
