import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/product_details/snapshot_fruit_detail.dart';

import '../product_details/product_detail_fruit.dart';

class ShowData extends StatelessWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      // return ListView.builder(
                      //   itemCount: snapshot.data!.docs.length,
                      //   itemBuilder: (context, index) {
                      //     return ListTile(
                      //       leading: CircleAvatar(
                      //         child: Text("${index + 1}"),
                      //       ),
                      //       title: Text("${snapshot.data!.docs[index]["pdname"]}"),
                      //       subtitle: Text("${snapshot.data!.docs[index]["kcal"]}"),
                      //     );
                      //   },
                      // );
                      return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 270,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SnapshotFruitDetailScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 10,
                                        ),
                                      ),
                                      Center(
                                          child: Text(
                                        snapshot.data!.docs[index]['pdname']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.asset(
                                              snapshot.data!.docs[index]['img']
                                                  .toString(),
                                              height: 140,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          snapshot.data!.docs[index]['kcal']
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              snapshot
                                                  .data!.docs[index]['carbs']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              snapshot
                                                  .data!.docs[index]['protein']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]['fat']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error.toString()}"),
                      );
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
