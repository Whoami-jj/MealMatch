import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_match/meal_suggestion.dart';

import 'dashboard.dart';

void main() {
  runApp(BmiCalculatorSuggestion());
}

class BmiCalculatorSuggestion extends StatefulWidget {
  BmiCalculatorSuggestion({super.key});
  @override
  _BmiCalculatorSuggestionState createState() =>
      _BmiCalculatorSuggestionState();
}

class _BmiCalculatorSuggestionState extends State<BmiCalculatorSuggestion> {
  bool showSecondButton = false;
  double _weight = 0.0;
  double _height = 0.0;
  String _bmiResult = '';
  String _mealSuggestion = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Expanded(
              child: Column(
                children: [
                  Slider(
                    value: _weight,
                    min: 0.0,
                    max: 200.0,
                    onChanged: (newValue) {
                      setState(() {
                        _weight = newValue;
                      });
                    },
                  ),
                  Text(
                    'Weight: $_weight kg',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    divisions: 200,
                    onChanged: (value) {
                      setState(() {
                        _height = value.roundToDouble();
                      });
                    },
                    label: '$_height cm',
                  ),
                  Text(
                    'Height: $_height cm',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showSecondButton = !showSecondButton;
                        double bmi = _weight / (_height * _height / 10000);
                        _bmiResult = bmi.toStringAsFixed(2);

                        if (bmi < 18.5) {
                          _mealSuggestion =
                              'Eat more fruits, vegetables, and whole grains.';
                        } else if (bmi < 25) {
                          _mealSuggestion =
                              'Continue to eat a healthy diet and exercise regularly.';
                        } else if (bmi < 30) {
                          _mealSuggestion =
                              'Reduce your intake of processed foods and sugary drinks.';
                        } else {
                          _mealSuggestion =
                              'Talk to your doctor about a weight management plan.';
                        }
                      });
                    },
                    child: Text('Calculate BMI'),
                  ),
                  SizedBox(height: 20.0),
                  Text('Your BMI: $_bmiResult'),
                  SizedBox(height: 20.0),
                  Text('Meal suggestion: $_mealSuggestion'),
                  SizedBox(height: 20),
                  if (showSecondButton)
                    ElevatedButton(
                      onPressed: () {
                        // Add logic for the second button tap
                        print('Second Button Tapped');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DietPlanScreen()));
                      },
                      child: Text('Diet Plan'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
