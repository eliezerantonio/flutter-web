import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  PageController scrolConroller = new PageController();

  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];
  int _currentIndex = 0;

  createScrollController(String routerName) {
    this.scrolConroller =
        new PageController(initialPage: getPageIndex(routerName));
    html.document.title = _pages[getPageIndex(routerName)];

    scrolConroller.addListener(() {
      final index = (this.scrolConroller.page ?? 0).round();

      if (index != _currentIndex) {
        final routeName = _pages[index];

        html.window.history.pushState(null, '', '#/$routeName');

        _currentIndex = index;
        html.document.title = _pages[index];
      }
    });
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
