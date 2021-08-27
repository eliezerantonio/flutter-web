import 'package:fluro/fluro.dart';
import 'package:leading_page/providers/page_provider.dart';
import 'package:leading_page/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']!.first;
    if (page != '/') {
      final pageProvider = Provider.of<PageProvider>(context!, listen: false);
      pageProvider.createScrollController(page);
      return HomePage();
    }
  },
);
