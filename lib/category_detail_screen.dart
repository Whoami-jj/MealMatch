import 'package:flutter/material.dart';
import 'package:meal_match/constructors/categories.dart';
import 'package:meal_match/dashboard.dart';


class CategoryDetail extends StatelessWidget{
  final Categories categories;
  CategoryDetail(this.categories);

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Detail'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 800,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                          itemCount: 20,
                          itemBuilder: (context,index)
                      {
                        return Card(
                          child: ListTile(
                            leading: Image(image : AssetImage(categories.productsimg)),
                            title: Text(categories.desc),
                            subtitle: Text(categories.descri),
                          ),
                        );
                      }
                      ),
                    ),
                      ),
                    //
                    // SizedBox(
                    //   width: 200,
                    //     child: Image(image: AssetImage(categories.img))),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(categories.desc,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 17.0,fontStyle: FontStyle.italic
                    //   ),),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(categories.descri,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //         fontSize: 17.0,fontStyle: FontStyle.italic
                    //     ),),
                    // ),
                  ],
                ),
              ),
            ),
    ),
    );
  }

}