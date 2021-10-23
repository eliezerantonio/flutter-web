import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;

  static bool isOpen = false;

  String _currentPage = '';
  String get currrentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    Future.delayed( const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  static Animation<double> movemnt = Tween<double>(begin: -200, end: 0).animate(
    CurvedAnimation(
      parent: menuController,
      curve: Curves.easeIn,
    ),
  );
  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: menuController,
      curve: Curves.easeIn,
    ),
  );

  static void openMenu() {
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
