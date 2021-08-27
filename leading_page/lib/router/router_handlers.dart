import 'package:fluro/fluro.dart';
import 'package:leading_page/ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;
  if (page != '/') return HomePage();
});
