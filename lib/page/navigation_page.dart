import 'package:flutter/material.dart';
import 'package:ui_tiktok_clone/page/home_page.dart';
import 'package:ui_tiktok_clone/widgets/custom_bottom_bar_widget.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _selectedIndex = 0;
  final _listPage = <Widget>[
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPage[_selectedIndex],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
