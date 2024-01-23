import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:meal_match/otp_screen.dart';
class PhoneForgetPass extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController otpController = TextEditingController();
  // String verificationId = "";
  //
  // Future<void> _verifyPhoneNumber() async {
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: '+92${phoneNumberController.text}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         // Auto-retrieve the SMS code on Android
  //         await _auth.signInWithCredential(credential);
  //         print("Phone number automatically verified: ${credential.smsCode}");
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print("Verification failed: $e");
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         setState(() {
  //           this.verificationId = verificationId;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         // Called when the automatic retrieval of the SMS code times out
  //         setState(() {
  //           this.verificationId = verificationId;
  //         });
  //       },
  //       timeout: Duration(seconds: 60),
  //     );
  //   } catch (e) {
  //     print("Error sending OTP: $e");
  //   }
  // }
  //
  // Future<void> _signInWithOTP() async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: otpController.text,
  //     );
  //
  //     await _auth.signInWithCredential(credential);
  //     print("User signed in with OTP");
  //   } catch (e) {
  //     print("Error signing in with OTP: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Phone Forget Pass',
                style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                SizedBox(height: 20,),
                Form(
                    child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: '+1-2347890',
                        labelText: 'Enter your Phone no',
                       border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                      }, child: Text('Next')),
                    )
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