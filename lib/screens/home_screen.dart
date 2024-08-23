import 'package:flutter/material.dart';
import '../widgets/custom_navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Navigation Drawer Active Menu
  int selectedIndex = 0;

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

  DateTime timeBackPressed = DateTime.now();
  bool canPopNow = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        showExitDialog(context);

      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Home',
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
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/System.png',
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'System',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Files.png',
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Files',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Marketing.png',
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Marketing',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Communication.png',
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Communication',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Courses.png',
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Courses',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/News.png',
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'News',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Popup function
  Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit App"),
        content: const Text("Do you want to exit this app?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

}
