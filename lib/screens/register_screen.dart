import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:larana_inc/screens/login_screen.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  var fullName = TextEditingController();
  var uEmail = TextEditingController();
  var uMob = TextEditingController();
  var uPass = TextEditingController();

  String encryptedText = '';
  String decryptedText = '';

  final keyData = encrypt.Key.fromUtf8('qwertyuiop');
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromUtf8('qwertyuiopasdfghjklzxcvb')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Register Screen ',
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
        backgroundColor: const Color(0xffF7CE4D),
      ),
      body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(30),
          color: Color(0xffF7CE4D),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create New Account',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 10,
                ),
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
                      const TextSpan(text: 'Already Registered?  '),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration
                                  .underline, // Optional: to show the text as a link
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ));
                              },
                          ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        controller: fullName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: const Text(
                            'Full Name',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffff0000),
                                style: BorderStyle.solid,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        controller: uEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffff0000),
                                style: BorderStyle.solid,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (value.length != 10) {
                            return 'Mobile number must be 10 digits long';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Mobile number must contain only digits';
                          }
                          return null;
                        },
                        controller: uMob,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          label: const Text(
                            'Mobile',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffff0000),
                                style: BorderStyle.solid,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                            return 'Minimum eight characters, \nat least one uppercase letter, \none lowercase letter, \none number and \none special character:';
                          }
                          return null;
                        },
                        controller: uPass,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          label: const Text(
                            'Password',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xff000000),
                                style: BorderStyle.solid,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffff0000),
                                style: BorderStyle.solid,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {

                              var name = fullName.text.toString();
                              var email = uEmail.text.toString();
                              var mobile = uMob.text.toString();
                              var password = uPass.text.toString();

                              final encrypted = encrypter.encrypt(password, iv: iv);
                              setState(() {
                                encryptedText = encrypted.base64;
                              });

                              final decrypted = encrypter.decrypt(encrypted, iv: iv);
                              setState(() {
                                decryptedText = decrypted;
                              });

                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('Processing Data')),
                              // );
                            }
                          },
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      if (encryptedText?.isNotEmpty ?? false)
                        Text('Encrypted Password: $encryptedText'),

                      if (decryptedText?.isNotEmpty ?? false)
                        Text('Decrypted Password: $decryptedText'),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
