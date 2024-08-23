import 'package:flutter/material.dart';

import '../widgets/custom_navigation_drawer.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // Navigation Drawer Active Menu
  int selectedIndex = 1;

  // Navigation Drawer Menus
  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Home',
    ),
    MenuItem(
      title: 'About Us',
    ),
    MenuItem(
      title: 'Services',
    ),
    MenuItem(
      title: 'Learning',
    ),
    MenuItem(
      title: 'Blog',
    ),
    MenuItem(
      title: 'Contact',
    ),
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
              'About',
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
            backgroundColor: Color(0xffF7CE4D),
          ),
          drawer: CustomNavigationDrawer(
            menuItems: menuItems,
            selectedMenuIndex: selectedIndex,
            onMenuItemSelected: onMenuItemSelected,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/about_us.png'),
                SizedBox(height: 8,),
                Text(
                  'About Us',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras adipiscing enim eu turpis egestas. Tristique risus nec feugiat in fermentum. ',
                  style: TextStyle(

                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Lacinia at quis risus sed vulputate. Viverra ipsum nunc aliquet bibendum enim facilisis.',
                  style: TextStyle(

                  ),
                )
              ],
            ),
          )),
    );
  }
}
