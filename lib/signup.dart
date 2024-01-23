import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_match/login.dart';
import 'package:meal_match/utils/utils.dart';
import 'package:sizer/sizer.dart';

import 'Auth/auth_service.dart';

class SignUp extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final phonenumber = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();

  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/logo.png',
                  height: 160,
                  width: 200,
                )),
                // SizedBox(height: 20,),

                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Create your profile to start your journey',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'William Watson',
                      labelText: 'Full Name',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'xyz@gmail.com',
                        labelText: 'E-mail',
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phonenumber,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      hintText: '+1234789',
                      labelText: 'Phone No',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      hintText: 'Password',
                      labelText: 'Password',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                // TextField(
                //   controller: _displayNameController,
                //   decoration: InputDecoration(
                //       prefixIcon: FaIcon(Icons.admin_panel_settings),
                //       hintText: 'Role',
                //       labelText: 'Role',
                //       border: OutlineInputBorder()),
                // ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                          if (formKey.currentState!.validate()) {
                            User? user =
                                await _authService.signUpWithEmailAndPassword(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              _displayNameController.text.trim(),
                            );
                            if (user != null) {
                              // Navigate to the home screen or perform other actions
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            } else {
                              // Handle signup failure
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Sign up failed. Please try again.'),
                                ),
                              );
                            }
                          }
                        },
                        child: Text('SIGNUP'))),
                Text('OR'),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/images/google.png',
                        width: 20.0,
                      ),
                      onPressed: () {},
                      label: Text(
                        'Signin with Google',
                      )),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(text: '  Login'),
                    ])))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
