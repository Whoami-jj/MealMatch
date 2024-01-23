import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:meal_match/contact_with_dietitian.dart';
import 'package:meal_match/sub_categories/contact_detail.dart';

import '../Admin/admin_screen.dart';


class ContactDetailScreen extends StatefulWidget {
  ContactDetail detail;
  ContactDetailScreen(
    this.detail,
  );

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  void _handleContactButtonTap(BuildContext context) {
    _directCall(widget.detail.phoneNumber);
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
  // void filterProducts(String query) {
  //   setState(() {
  //     if (query.isNotEmpty) {
  //       filteredSubcategories = detail
  //           .where((product) =>
  //           product.pdname.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     } else {
  //       filteredSubcategories = subcategories;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Detail Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(250),
                        child: Image.asset(widget.detail.img),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        widget.detail.name,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        widget.detail.email,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        widget.detail.phoneNumber,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.detail.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Qualification',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.detail.qualification,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  _handleContactButtonTap(
                                    context,
                                  );
                                },
                                child: Text('Contact'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],

          ),

        ),
      ),
    );
  }
}
