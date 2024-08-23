import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:larana_inc/screens/forget_password_screen.dart';
import 'package:larana_inc/screens/home_screen.dart';
import 'package:larana_inc/screens/register_screen.dart';
import 'package:larana_inc/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();
  bool isChecked = false;
  String result = "";

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
            'Login',
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
          backgroundColor: Color(0xffF7CE4D),
        ),
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(30),
          color: Color(0xffF7CE4D),
          child: SingleChildScrollView(
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
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passWordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    label: Text(
                      'Password',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.black; // Color when selected
                              }
                              return Colors.white; // Default color
                            }),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        Text(
                          'Remember',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                  decoration: TextDecoration
                                      .underline
                              ),
                              children: [
                                TextSpan(
                                  text: "Forget Password?",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ForgetPasswordScreen();
                                        },
                                      ));
                                    },
                                ),
                              ]),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () async {
                        var userName = userNameController.text;
                        var passWord = passWordController.text;

                        if (userName.isNotEmpty && passWord.isNotEmpty) {
                          var sharedPref = await SharedPreferences.getInstance();
                          sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ));
                        } else {
                          setState(() {
                            result = "Please Fill all the Required Blanks!!!";
                          });
                        }
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(result),
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/Login_Image_new.png', width: 100,),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(text: "Don't have account? "),
                        TextSpan(
                          text: "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration
                                .underline, // Optional: to show the text as a link
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return RegisterScreen();
                                },
                              ));
                            },
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
