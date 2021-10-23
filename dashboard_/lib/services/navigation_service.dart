import 'package:flutter/material.dart';

class NavigationService {
  
  static GlobalKey<NavigatorState> nivigatorKey =
       GlobalKey<NavigatorState>();

  static nivigateTo(String routeName) {
    return nivigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) {
    return nivigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
