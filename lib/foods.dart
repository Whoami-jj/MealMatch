import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/product_details/product_details.dart';
import 'package:meal_match/sub_categories/sub_categories.dart';

class Foods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Foods'),
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

  Widget gridFood() {
    return GridView.builder(
        itemCount: subcategories.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          mainAxisExtent: 270,
        ),
        itemBuilder: (context, index) {
          SubCatagories subfood = subcategories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetails(
                  subfood,
                  singleproduct: subfood,
                );
              }));
            },
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    subfood.pdname,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          subfood.img,
                          height: 140,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      subfood.kcal,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subfood.carbs,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            subfood.protein,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            subfood.fat,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
