import 'package:contador/ui/views/counter_view.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
  static void configureRoutes() {
    router.define('/', handler: _counterHandler);
  }

  //handlers

  static Handler _counterHandler = new Handler(
    handlerFunc: (context, params) => CounterView(),
  );
}
