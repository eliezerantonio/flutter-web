import 'package:dashboard_/providers/sidemenu_provider.dart';
import 'package:dashboard_/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false).setCurrentPageUrl('/404');
    return NoPageFoundView();
  });
}
