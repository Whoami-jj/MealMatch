import 'package:flutter/material.dart';

void main() => runApp(const BmiCalculator());

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BmiCalculator1(),
    );
  }
}

class BmiCalculator1 extends StatefulWidget {
  @override
  _BmiCalculator1State createState() => _BmiCalculator1State();
}

class _BmiCalculator1State extends State<BmiCalculator1> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _bmi = 0;
  String _message = '';

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    _bmi = weight / (height * height);

    setState(() {
      if (_bmi < 18.5) {
        _message = 'Underweight';
      } else if (_bmi < 25) {
        _message = 'Normal weight';
      } else if (_bmi < 30) {
        _message = 'Overweight';
      } else {
        _message = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Enter your height in centimeters:'),
              TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  labelText: 'Height (cm)',
                ),
              ),
              SizedBox(height: 20),
              Text('Enter your weight in kilograms:'),
              TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 20),
              Text('Your BMI: ${_bmi.toStringAsFixed(2)}'),
              Text('Message: $_message'),
            ],
          ),
        ),
      ),
    );
  }
}
