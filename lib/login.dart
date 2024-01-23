import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_match/Admin/admin_screen.dart';
import 'package:meal_match/dashboard.dart';
import 'package:meal_match/email_forget_pass.dart';
import 'package:meal_match/phone_forget_pass.dart';
import 'package:meal_match/signup.dart';
import 'package:meal_match/utils/utils.dart';
import 'package:sizer/sizer.dart';

import 'Auth/auth_service.dart';
import 'User_Role/user_role.dart';

class Login extends StatelessWidget {
  // final _emailcontroller = TextEditingController();
  // final _passcontroller = TextEditingController();
  // FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRoleService _userRoleService = UserRoleService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    return Sizer(
      builder: (context, orientation, deviceType) => WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: size.height * 0.3,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_2_outlined),
                                hintText: 'xyz@gmail.com',
                                labelText: 'E-Mail',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_open_outlined),
                                hintText: 'Enter your password',
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Pass';
                              }
                              return null;
                            },
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                              child: Padding(
                                                padding: EdgeInsets.all(30.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Make Selection!',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        'Select one of the options given below to reset yout password'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        EmailForgetPass()));
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors
                                                              .grey.shade400,
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Icon(Icons
                                                                .email_outlined),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'E-mail',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    'Reset via E-mail Verification'),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PhoneForgetPass()));
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors
                                                              .grey.shade400,
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Icon(Icons
                                                                .mobile_friendly_outlined),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Phone No',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    'Reset via Phone Verification'),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  child: Text('Forget Password?'))),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  //_signInWithEmailAndPassword(context);
                                  // if (formKey.currentState!.validate()) {
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                        email: _emailController.text
                                            .toString()
                                            .trim(),
                                        password: _passwordController.text
                                            .toString())
                                        .then((value) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const DashBoard()));
                                    }).onError((error, stackTrace) {
                                      Utils().toastMessage(error.toString());
                                    });

                                  // User? user = await _authService
                                  //     .signInWithEmailAndPassword(
                                  //   _emailController.text.trim(),
                                  //   _passwordController.text.trim(),
                                  // );

                                  // if (user != null) {
                                  //   String? userRole = await _userRoleService
                                  //       .getUserRole(user.uid);
                                  //
                                  //   if (userRole == 'admin') {
                                  //     // Navigate to the admin screen
                                  //     Navigator.pushReplacement(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 AdminPanel()));
                                  //   } else if (userRole == 'user') {
                                  //     // Navigate to the user screen
                                  //     Navigator.pushReplacement(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 DashBoard()));
                                  //   } else {
                                  //     // Handle invalid user role
                                  //     print('Invalid user role');
                                  //   }
                                  // } else {
                                  //   // Handle login failure
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //       content: Text(
                                  //           'Login failed. Please try again.'),
                                  //     ),
                                  //   );
                                  // }
                                },
                                child: Text('Login')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('OR'),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                                icon: Image.asset(
                                  'assets/images/google.png',
                                  width: 20.0,
                                ),
                                onPressed: () {},
                                label: Text('Sigin with Google')),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: 'Doesn\'t\ have an account?',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(text: '  SIGNUP'),
                              ])))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
