import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  PageController scrolConroller = new PageController();

  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

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
