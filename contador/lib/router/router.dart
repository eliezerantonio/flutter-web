import 'package:fluro/fluro.dart';

import 'package:contador/ui/views/counter_provider_view.dart';
import 'package:contador/ui/views/counter_view.dart';
import 'package:contador/ui/views/view404.dart';

import 'route_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
    );

    //statefull
    router.define(
      '/stateful',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define('/stateful/:base',
        handler: counterHandler, transitionType: TransitionType.fadeIn);

    //fim statefull

    router.define(
      '/provider',
      handler: counterProviderHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = pageNotFoundHandler;
  }
}
