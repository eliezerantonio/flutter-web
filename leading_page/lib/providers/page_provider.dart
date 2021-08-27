import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  PageController scrolConroller = new PageController();

  goTo(index) {
    scrolConroller.animateToPage(
      index,
      duration: Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
