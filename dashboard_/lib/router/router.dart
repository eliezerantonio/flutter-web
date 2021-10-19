import 'package:dashboard_/router/admin_handlers.dart';
import 'package:dashboard_/router/dashboard_handlers.dart';
import 'package:dashboard_/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categories';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.none);

    router.define(iconsRoute,
        handler: DashboardHandlers.icons, transitionType: TransitionType.none);
    router.define(blankRoute,
        handler: DashboardHandlers.blank, transitionType: TransitionType.none);
    router.define(categoriesRoute,
        handler: DashboardHandlers.categories, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
