import 'package:fluro/fluro.dart';
//handlers
import 'package:contador/ui/views/counter_provider_view.dart';
import 'package:contador/ui/views/counter_view.dart';
import 'package:contador/ui/views/view404.dart';

final Handler counterHandler = new Handler(
  handlerFunc: (context, params) {
    return CounterView(
      base: params['base']?.first ?? '10',
    );
  },
);

final Handler counterProviderHandler =
    new Handler(handlerFunc: (context, params) {
  return CounterProviderView(
    base: params['q']?.first ?? '5',
  );
});

//404

final Handler pageNotFoundHandler =
    new Handler(handlerFunc: (context, params) => View404());
