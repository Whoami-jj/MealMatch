import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../product_details/product_detail_drink.dart';
import '../sub_categories/sub_categories.dart';

class Drinks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Drinks'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            gridFood(),
          ],
        ),
      ),
    );
  }
}
Widget gridFood() {
  return GridView.builder(
      itemCount: drinkcat.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
        mainAxisExtent: 270,
      ),
      itemBuilder: (context, index) {
        DrinkCat subdrink = drinkcat[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DrinkProductDetail(
                subdrink,
                subdrink,
                drinkproducts: null,
              );
            }));
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Center(
                      child: Text(
                        subdrink.pdname,
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
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          subdrink.img,
                          height: 140,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      subdrink.kcal,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          subdrink.carbs,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 8, color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          subdrink.protein,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 8, color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          subdrink.fat,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 8, color: Colors.black),
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
}
