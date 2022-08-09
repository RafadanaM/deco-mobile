import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/test.dart';

import '../components/layout.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // use this if arguments want to be passed
    final args = settings.arguments;

    switch (settings.name) {
      case Layout.routeName:
        return MaterialPageRoute(builder: (context) => const Layout());
      case Test.routeName:
        return MaterialPageRoute(builder: (context) => const Test());
      default:
        // insert not found route here
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text("Page Not Found"),
        ),
      );
    });
  }
}
