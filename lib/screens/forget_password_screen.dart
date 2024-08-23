import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget{
  @override
  State<ForgetPasswordScreen> createState() => ForgetPasswordScreenState();

}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Forget Password',
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
        backgroundColor: Color(0xffF7CE4D),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Coming Soon', style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),),
          )
        ],
      ),
    );
  }
}