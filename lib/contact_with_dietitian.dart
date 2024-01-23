import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:meal_match/Admin/admin_screen.dart';
import 'package:meal_match/product_details/contact_detail_screen.dart';
import 'package:meal_match/sub_categories/contact_detail.dart';
import 'dart:core';
void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dietitian Contact List'),
      ),

      body: ListView.builder(
        itemCount: dietitians.length,
        itemBuilder: (context, index) {
          ContactDetail detail = dietitians[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
               child: ListTile(
                  leading: FittedBox(
                    child: Image.asset(detail.img),
                  ),
                  title: Text(dietitians[index].name),
                  subtitle: Text('Phone: ${detail.phoneNumber}\nEmail: ${detail.email}'),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactDetailScreen(detail)));
                  },
                  trailing: ElevatedButton(
                    onPressed: () {
                      _handleContactButtonTap(context, detail.phoneNumber);

                    },
                    child: Text('Contact'),
                  ),
                )
            ),
          );
        },
      ),
    );
  }
  }
  void _handleContactButtonTap(BuildContext context, String phoneNumber) {
    _directCall(phoneNumber);
  }

  void _directCall(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (res != null && res) {
      // Successfully initiated the call
      print('Calling $phoneNumber');
    } else {
      // Handle error
      print('Error calling $phoneNumber');
    }
}
