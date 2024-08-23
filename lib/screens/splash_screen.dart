import 'dart:async';

import 'package:flutter/material.dart';
import 'package:larana_inc/screens/home_screen.dart';
import 'package:larana_inc/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    WhereToGo();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const String KEYLOGIN = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Larana, Inc.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/Larana_Inc_Logo.png',
                  width: 100,
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 200,
                  height: 8,
                  child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _animation.value,
                      color: Color(0xffF7CE4D),
                      backgroundColor: Color(0xff000000),
                      borderRadius: BorderRadius.circular(10),

                    );
                  },
                                ),
                ),
            ]
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                      'assets/images/Larana_Inc_splash.png',
                        width: 250,
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }

  void WhereToGo() async{

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 5), () {

      if(isLoggedIn!=null){
          if(isLoggedIn){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ));
          }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ));
      }




    },);


  }

}
