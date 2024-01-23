import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:meal_match/Swiper/second_btn.dart';
import 'package:meal_match/bmi_cal_meal_suggestion.dart';
import 'package:meal_match/bmi_calculator.dart';
import 'package:meal_match/login.dart';
import 'package:meal_match/meal_suggestion.dart';
import 'package:meal_match/signup.dart';

import '../dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WalkthroughScreen(),
    );
  }
}

class WalkthroughScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/logo.png',
    'assets/images/food.png',
    'assets/images/nuts.png',
  ];

  final List<String> titles = [
    'Welcome to MyApp',
    'Explore Features',
    'Get Started',
  ];

  final List<String> subtitles = [
    'Discover the amazing features of MyApp.',
    'Explore and enjoy the unique functionalities.',
    'Start using MyApp and enhance your experience.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Swiper(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return WalkthroughItem(
              image: images[index],
              title: titles[index],
              subtitle: subtitles[index],
            );
          },
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Colors.blue,
            ),
          ),
          control: SwiperControl(color: Colors.grey
          ),
        ),
      ),
    );
  }
}

class WalkthroughItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  WalkthroughItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 100,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          }, child: Text('Get Started')),
        ],
      ),

    );
  }
}
