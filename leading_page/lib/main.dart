import 'package:flutter/material.dart';
import 'package:leading_page/router/router.dart';
import 'package:leading_page/router/router_handlers.dart';

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
      title: 'Vertical leading page',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
