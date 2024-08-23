import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/custom_navigation_drawer.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  // Navigation Drawer Active Menu
  int selectedIndex = 2;

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

  List<Photos> photosList = [];
  Future<List<Photos>> getPhotos() async{
    photosList.clear();

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
        for(Map i in data){
          Photos photos = Photos(title: i['title'], url: i['url'], id:i['id'], albumId:i['albumId'] );
          photosList.add(photos);
        }
        return photosList;
    }else{
        return photosList;
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
                'Services',
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
                  builder: (context, AsyncSnapshot<List<Photos>> snapshot){
    if(!snapshot.hasData){
    return Text('Loading......');
    }else {
      return ListView.builder(
          itemCount: photosList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    snapshot.data![index].url.toString()),
              ),
              title: Text(snapshot.data![index].title.toString()),
              trailing: CircleAvatar(
                  child: Text(snapshot.data![index].id.toString())),
            );
          });
    }
                  },
                future: getPhotos(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Photos {
  String title, url;
  int id, albumId;
  Photos({required this.title, required this.url, required this.id, required this.albumId  });
}