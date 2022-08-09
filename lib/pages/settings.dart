import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/test.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: const Text("Settings"),
        onTap: () {
          Navigator.pushNamed(context, Test.routeName);
        },
      ),
    );
  }
}
