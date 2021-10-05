import 'package:dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    return NoPageFoundView();
  });
}
