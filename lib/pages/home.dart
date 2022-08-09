import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  bool shouldKeepAlive = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: ListView.builder(
        itemCount: Utils.items.length,
        prototypeItem: ListTile(
          title: Text(Utils.items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Utils.items[index]),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => shouldKeepAlive;
}
