import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  PageController scrolConroller = new PageController();

  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  createScrollController(String routerName) {
    this.scrolConroller =
        new PageController(initialPage: getPageIndex(routerName));
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(index) {
    final routeName = _pages[index];
    html.window.history.pushState(null, '', '#/$routeName');
    scrolConroller.animateToPage(
      index,
      duration: Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
