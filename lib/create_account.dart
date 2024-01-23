import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("CreateAccount"),
        ),
        body : Column(
          children: [
            Container(
              color: Colors.white,
                height: 150,
                width: 100,
                child: Image.asset('assets/images/pineapple.png')),
            SizedBox(height:20 ,),
            Center(
                child: Text('It is good to see you again')
            ),
            SizedBox(height:30 ,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                  onPressed: (){},
                  child: Text('Continue with Apple',style: TextStyle(color:Colors.white ),)),
            ),
            Positioned(
              left: 200,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: (){},
                    child: Text('Continue with Google',style: TextStyle(color:Colors.white ),)),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  onPressed: (){},
                  child: Text('Continue with Email',style: TextStyle(color:Colors.white ),)),
            ),
          ],
        )
      ),
    );

  }

}