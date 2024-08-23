import 'package:flutter/material.dart';

import '../widgets/custom_navigation_drawer.dart';

class LearningScreen extends StatefulWidget {
  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {

  // Navigation Drawer Active Menu
  int selectedIndex = 3;

  // Navigation Drawer Menus
  final List<MenuItem> menuItems = [
    MenuItem(title: 'Home',),
    MenuItem(title: 'About Us',),
    MenuItem(title: 'Services',),
    MenuItem(title: 'Learning',),
    MenuItem(title: 'Blog',),
    MenuItem(title: 'Contact',),
  ];

  // Navigation Drawer Menu State Updating
  void onMenuItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool canPopNow = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(

      canPop: canPopNow,
      onPopInvoked: (bool value) {

        setState(() {
          canPopNow = !value;
        });

        if (canPopNow) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Click once more to go back"),
              duration: Duration(milliseconds: 1500),
            ),
          );
        }

      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                'Learning',
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
          backgroundColor: Color(0xffF7CE4D),
        ),
        drawer: CustomNavigationDrawer(
          menuItems: menuItems,
          selectedMenuIndex: selectedIndex,
          onMenuItemSelected: onMenuItemSelected,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Selected Page Index: $selectedIndex'),
            )
          ],
        ),
      ),
    );
  }
}