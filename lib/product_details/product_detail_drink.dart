import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/sub_categories/sub_categories.dart';

class DrinkProductDetail extends StatelessWidget {
  DrinkCat drinkproduct;
  DrinkProductDetail(cat, this.drinkproduct, {required drinkproducts});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            stackDesgin(),
            detail(),
            // dataTable(),
          ],
        ),
      ),
    ));
  }

  dataTable() {
    return Expanded(
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                "Kcal",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Carbs',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Protein',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Fat',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              ),
            ),
          ),
        ],
        rows: [
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                drinkproduct.kcal,
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              )),
              DataCell(Text(
                drinkproduct.carbs,
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              )),
              DataCell(Text(
                drinkproduct.protein,
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              )),
              DataCell(Text(
                drinkproduct.fat,
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget stackDesgin() {
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
                borderRadius: BorderRadius.circular(250),
                child: Image.asset(
                  drinkproduct.img,
                  fit: BoxFit.cover,
                  height: 250,
                  width: 250,
                )),
          ),
        ],
      ),
    );
  }

  Widget detail() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                drinkproduct.pdname,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
              Text('About Food',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                drinkproduct.desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Nutritionist Value",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dataTable(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
