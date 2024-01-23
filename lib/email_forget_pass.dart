import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/login.dart';

import 'otp_screen.dart';

class EmailForgetPass extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      // Show success message or navigate to login screen
      print('Password reset email sent. Check your email for instructions.');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

    } catch (e) {
      // Show an error message
      print('Error sending password reset email: $e');
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text('Email Forget Pass',
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 20,),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'xyz@gmail.com',
                      labelText: 'Enter your E-mail',
                      border: OutlineInputBorder(
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        _resetPassword(context);
                      }, child: Text('Next')))
                ]
              ),
            ),
          ),
        ),
        ),

    );
  }
}