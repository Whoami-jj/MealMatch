import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(CaloriesTrackerApp());
}

class CaloriesTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calories Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> caloriesList = [];

  void addCalories(int calories) {
    setState(() {
      caloriesList.add(calories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calories Tracker'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: caloriesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${caloriesList[index]} calories'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter calories',
              ),
              onSubmitted: (value) {
                addCalories(int.parse(value));
              },
            ),

          ),
        ],
      ),
    );
  }
}