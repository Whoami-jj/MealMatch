import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/Chat_page.dart';
import 'package:meal_match/bmi_cal_meal_suggestion.dart';
import 'package:meal_match/bmi_calculator.dart';
import 'package:meal_match/category_food/Snacks.dart';
import 'package:meal_match/category_food/drinks.dart';
import 'package:meal_match/category_food/fruits.dart';
import 'package:meal_match/category_food/vegetables.dart';
import 'package:meal_match/contact_with_dietitian.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_match/foods.dart';
import 'package:meal_match/login.dart';
import 'package:meal_match/meal_suggestion.dart';
import 'package:meal_match/product_details/product_details.dart';
import 'package:meal_match/sub_categories/sub_categories.dart';
import 'package:meal_match/Admin/admin_screen.dart';
import 'package:meal_match/sugar_patient.dart';
import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentPageIndex = 0;
  // var height = MediaQuery.of(context as BuildContext).size;
  // var width = MediaQuery.of(context as BuildContext).size;
  TextEditingController searchController = TextEditingController();
  List<SubCatagories> filteredSubcategories = subcategories;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType)=>
          SafeArea(
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Center(
                child: Text(
                  'Meal Match',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Welcome to our app\nMeal Match',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.home),
                    title: Text('Home'),
                    onTap: () {
                      // Handle item 1 tap
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                  ),
                  ListTile(
                    leading: FaIcon(Icons.set_meal_outlined),
                    title: Text('Diabaties'),
                    onTap: () {
                      // Handle item 2 tap
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SugarPatientScreen()));
                    },
                  ),
                  ListTile(
                    leading: FaIcon(Icons.local_hospital),
                    title: Text('Contact with Dietatian'),
                    onTap: () {
                      // Handle item 2 tap
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactListScreen()));
                    },
                  ),
                  ListTile(
                    leading: FaIcon(Icons.logout_outlined),
                    title: Text('Logout'),
                    onTap: () {
                      // Handle item 2 tap
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                    child: FaIcon(
                      CupertinoIcons.home,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SugarPatientScreen()));
                    },
                    child: FaIcon(
                      Icons.set_meal_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactListScreen()));
                    },
                    child: FaIcon(
                      Icons.contact_mail_rounded,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            body: Sizer(
            builder: (context, orientation, deviceType)=> SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '   Find the best\n   Health for you',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:7.w,vertical: 3.w),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          filterProducts(value);
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: 'Find your Nutrition',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                Sizer(
            builder: (context, orientation, deviceType)=> Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Calculate your BMI',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Center(
                              child: Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: InkWell(
                                        onTap: ()
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => BmiCalculatorSuggestion()));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal:12.w,),
                                          child: Image.asset('assets/images/bmi.jpg'),
                                        ))),
                              ),
                            ),

                          ],
                        ),
                        margin: EdgeInsets.only(left: 20.0, right: 20.0,top : 5.0),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '   Categories',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Foods()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  //
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/food.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text('Foods',)
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Fruits()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  //
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/fruits.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text('Fruits')
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Drinks()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  //
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/cocktail.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text('Drinks')
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Snacks()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  //
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/nuts.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text('Snacks')
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Vegetables()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  //
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                        "assets/images/vegetable.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text('Vegetables')
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                          '  '
                          'Popular',
                          style: TextStyle(fontSize: 15)),
                    ),
                    gridFood(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
  void filterProducts(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredSubcategories = subcategories
            .where((product) =>
            product.pdname.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredSubcategories = subcategories;
      }
    });
  }

  Widget gridFood() {
    return Sizer(
    builder: (context, orientation, deviceType)=> GridView.builder(
          itemCount: filteredSubcategories.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 8,
            mainAxisExtent: 270,
          ),
          itemBuilder: (context, index) {
            // SubCatagories subfood = subcategories[index];
            SubCatagories subfood = filteredSubcategories[index];
            return Sizer(
              builder: (context, orientation, deviceType)=> GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetails(
                      subfood,
                      singleproduct: subfood,
                    );
                  }));
                },
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
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
                          subfood.pdname,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                subfood.carbs,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 8, color: Colors.black),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                subfood.protein,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 8, color: Colors.black),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                subfood.fat,
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
              ),
            );
          }),
    );
  }
}

