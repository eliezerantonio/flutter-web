import 'package:fluro/fluro.dart';

import 'package:contador/ui/views/counter_provider_view.dart';
import 'package:contador/ui/views/counter_view.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _counterHandler,
    );

    router.define(
      '/stateful',
      handler: _statefulHandler,
    );
    router.define(
      '/provider',
      handler: _providerHandler,
    );
  }

  //handlers
  static Handler _counterHandler = new Handler(
    handlerFunc: (context, params) => CounterView(),
  );
  static Handler _statefulHandler = new Handler(
    handlerFunc: (context, params) => CounterView(),
  );

  static Handler _providerHandler =
      new Handler(handlerFunc: (context, params) => CounterProviderView());
}
