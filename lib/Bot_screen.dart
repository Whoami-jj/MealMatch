import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/Chat_page.dart';

class BotScreen extends StatefulWidget {
  const BotScreen({Key? key}) : super(key: key);

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: ChatPageScreen(),
    );
  }
}
