import 'package:flutter/material.dart';
import 'common/components/layout.dart';
import 'common/configs/route_generator.dart';
import 'common/configs/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      initialRoute: Layout.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
