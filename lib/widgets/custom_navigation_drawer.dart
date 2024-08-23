import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:larana_inc/screens/login_screen.dart';
import 'package:larana_inc/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/about_screen.dart';
import '../screens/blog_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/home_screen.dart';
import '../screens/learning_screen.dart';
import '../screens/services_screen.dart';

class CustomNavigationDrawer extends StatefulWidget {

  final List<MenuItem> menuItems;
  final Function(int) onMenuItemSelected;
  final int selectedMenuIndex;

  CustomNavigationDrawer({
    required this.menuItems,
    required this.onMenuItemSelected,
    required this.selectedMenuIndex,
  });

  @override
  State<CustomNavigationDrawer> createState() => CustomNavigationDrawerState();
}

class CustomNavigationDrawerState extends State<CustomNavigationDrawer> {

  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AboutScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ServicesScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LearningScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BlogScreen()),
        );
        break;
      case 5:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ContactScreen()),
        );
        break;
      default:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffF7CE4D),
      child: Column(
        children: [
          // Header can be customized as needed
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.none)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Larana_Inc_Logo_white.png',
                  width: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Larana, Inc.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: widget.menuItems.length,
              itemBuilder: (context, index) {
                final item = widget.menuItems[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: index == 0 ? BorderSide(color: Colors.black) : BorderSide.none,
                      bottom: BorderSide(color: Colors.black), // Bottom border
                    ),
                  ),
                  child: ListTile(
                    title: Text(item.title),
                    selectedColor: Colors.white,
                    selected: widget.selectedMenuIndex == index,
                    onTap: () {
                      widget.onMenuItemSelected(index);
                      navigateToScreen(context, index); // Close the drawer after selection
                    },
                  ),
                );
              },
            ),
          ),

          //Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool keyExists = prefs.containsKey(SplashScreenState.KEYLOGIN);

                if (keyExists) {
                  print("KEYLOGIN exists, removing it.");
                  prefs.remove(SplashScreenState.KEYLOGIN);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
                } else {
                  print("KEYLOGIN does not exist.");
                }
              },
          ),

        ],
      ),
    );
  }
}

class MenuItem {
  final String title;
  MenuItem({
    required this.title,
  });
}