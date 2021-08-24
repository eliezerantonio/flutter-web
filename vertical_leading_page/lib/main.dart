import 'package:flutter/material.dart';
import 'package:vertical_leading_page/router/router.dart';
import 'package:vertical_leading_page/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical Scrolling',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
