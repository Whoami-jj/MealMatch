import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/product_details/product_detail_vegetables.dart';

import '../sub_categories/sub_categories.dart';

class Vegetables extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Text('Vegetables'),
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
      itemCount: vegetablecat.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
        mainAxisExtent: 270,
      ),
      itemBuilder: (context, index) {
        VegetableCat subvegetable = vegetablecat[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VegetablesProductDetail(
                subvegetable,
                subvegetable,
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
                        subvegetable.pdname,
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
                          subvegetable.img,
                          height: 140,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      subvegetable.kcal,
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
                          subvegetable.carbs,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 8, color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          subvegetable.protein,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 8, color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          subvegetable.fat,
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
