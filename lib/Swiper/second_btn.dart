import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  bool showSecondButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conditional Button Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Toggle the state to show/hide the second button
                  showSecondButton = !showSecondButton;
                });
              },
              child: Text('Toggle Second Button'),
            ),
            SizedBox(height: 20),
            if (showSecondButton)
              ElevatedButton(
                onPressed: () {
                  // Add logic for the second button tap
                  print('Second Button Tapped');
                },
                child: Text('Second Button'),
              ),
          ],
        ),
      ),
    );
  }
}
