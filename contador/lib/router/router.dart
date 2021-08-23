import 'package:fluro/fluro.dart';

import 'package:contador/ui/views/counter_provider_view.dart';
import 'package:contador/ui/views/counter_view.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _counterHandler,
      transitionType: TransitionType.none,
    );

    router.define('/stateful',
        handler: _counterStatefulHandler, transitionType: TransitionType.none);

    router.define(
      '/provider',
      handler: _counterProviderHandler,
      transitionType: TransitionType.none,
    );
  }

  //handlers
  static Handler _counterHandler = new Handler(
    handlerFunc: (context, params) => CounterView(),
  );

  static Handler _counterStatefulHandler = new Handler(
    handlerFunc: (context, params) => CounterView(),
  );

  static Handler _counterProviderHandler = new Handler(
    handlerFunc: (context, params) => CounterProviderView(),
  );
}
