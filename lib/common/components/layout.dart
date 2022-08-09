import 'package:flutter/material.dart';
import 'package:flutter_application_1/books/data/repositories/books_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../books/bloc/books_cubit.dart';
import '../../pages/home.dart';
import '../../pages/books.dart';
import '../../pages/profile.dart';
import '../../pages/settings.dart';

class Layout extends StatefulWidget {
  static const routeName = '/';
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int index = 0;

  void pageChanged(int idx) {
    setState(() {
      index = idx;
      controller.animateToPage(idx,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(BooksRepositoryImpl()),
      child: Scaffold(
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[Home(), Books(), Profile(), Settings()],
        ),
        bottomNavigationBar: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (idx) {
            pageChanged(idx);
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.mail_outlined), label: 'Mail'),
            NavigationDestination(
                icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined), label: 'Settings')
          ],
        ),
      ),
    );
  }
}
