import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Code Verification',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
              Form(child: Column(
                children: [
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.black.withOpacity(0.2),
                    filled: true,
                    onSubmit: (code){
                      print('Your OTP is $code');
                    },
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                      child: ElevatedButton(onPressed: (){}, child: Text('Verify')))
                ],
              ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}