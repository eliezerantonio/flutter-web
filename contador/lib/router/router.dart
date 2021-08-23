import 'package:fluro/fluro.dart';

import 'package:contador/ui/views/counter_provider_view.dart';
import 'package:contador/ui/views/counter_view.dart';
import 'package:contador/ui/views/view404.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );

    //statefull
    router.define(
      '/stateful',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/stateful/:base',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );

    //fim statefull

    router.define(
      '/provider',
      handler: _counterProviderHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = _pageNotFoundHandler;
  }

  //handlers
  static Handler _counterHandler = new Handler(
    handlerFunc: (context, params) {
      print(params['base']?[0]);
      return CounterView();
    },
  );

  static Handler _counterProviderHandler = new Handler(
    handlerFunc: (context, params) => CounterProviderView(),
  );

  //404

  static Handler _pageNotFoundHandler =
      new Handler(handlerFunc: (context, params) => View404());
}
