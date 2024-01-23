import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapshotFruitDetailScreen extends StatefulWidget {
  const SnapshotFruitDetailScreen({Key? key}) : super(key: key);

  @override
  State<SnapshotFruitDetailScreen> createState() =>
      _SnapshotFruitDetailScreenState();
}

class _SnapshotFruitDetailScreenState extends State<SnapshotFruitDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Product Detail'),
              backgroundColor: Colors.blue,
            ),
            body: Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(250),
                                            child: Image.asset(
                                              snapshot.data!.docs[index]['img']
                                                  .toString(),
                                              fit: BoxFit.cover,
                                              height: 250,
                                              width: 250,
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          // Placeholder or loading indicator
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      } else {
                        // Placeholder or loading indicator
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))));
  }
}
