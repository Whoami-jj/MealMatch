import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var products = snapshot.data!.docs;

          List<Widget> productWidgets = [];
          for (var product in products) {
            var productName = product['name'];
            var productPrice = product['price'];
            var productImage = product['image'];

            var productWidget = ListTile(
              title: Text(productName),
              subtitle: Text('\$$productPrice'),
              leading: productImage != null
                  ? Image.file(
                File(productImage),
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              )
                  : SizedBox.shrink(),
            );

            productWidgets.add(productWidget);
          }

          return ListView(
            children: productWidgets,
          );
        },
      ),
    );
  }
}
