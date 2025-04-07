import 'package:flutter/material.dart';
import 'package:test_news_app/navigation/main_navigation.dart';

import 'package:test_news_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loader,

    );
  }
}
