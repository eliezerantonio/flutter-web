import 'package:flutter/material.dart';
import 'package:leading_page/providers/page_provider.dart';
import 'package:leading_page/router/router.dart';
import 'package:leading_page/router/router_handlers.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => PageProvider(),
       
      )
    ],
      child: MyApp(),
    
    );
  }
}

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
