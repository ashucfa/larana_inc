import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/json_placeholder.dart';
import '../widgets/custom_navigation_drawer.dart';

class BlogScreen extends StatefulWidget {
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

  // Navigation Drawer Active Menu
  int selectedIndex = 4;

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

  List<JsonPlaceholder> jsonList = [];
  Future<List<JsonPlaceholder>> getPostApi()async{
    jsonList.clear();
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200 ){
        for (Map<String, dynamic> i in data.cast<Map<String, dynamic>>()) {
          jsonList.add(JsonPlaceholder.fromJson(i));
        }
          return jsonList;
      }else{
          return jsonList;
      }
  }


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
                'Blog',
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
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                      return Text('Loading......');
                  }else{
                    return ListView.builder(
                        itemCount: jsonList.length,

                        itemBuilder: (context, index){
                          final user = jsonList[index];
                          final userAddress = user.address;
                      return Card(

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text('Id: ${user.id}'),
                              Text('Name: ${user.name}'),
                              Text('Username: ${user.username}'),
                              Text('Email: ${user.email}'),
                              Text('Street: ${userAddress?.street}'),
                              Text('Suite: ${userAddress?.suite}'),
                              Text('City: ${userAddress?.city}'),
                              Text('Zipcode: ${userAddress?.zipcode}'),
                              Text('Lat: ${userAddress?.geo?.lat}'),
                              Text('Lng: ${userAddress?.geo?.lng}'),
                              Text('Phone: ${user.phone}'),
                              Text('Website: ${user.website}'),
                              Text('Cpny Name: ${user.company?.name}'),
                              Text('Cpny catchPhrase: ${user.company?.catchPhrase}'),
                              Text('Cpny Bs: ${user.company?.bs}'),
                            ],
                          ),
                        ),
                      );
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}