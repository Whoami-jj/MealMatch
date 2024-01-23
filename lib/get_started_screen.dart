import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:meal_match/lose_weight.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goals = [
      'Lose Weight',
      'Maintain Weight',
      'Gain Weight',
      'Build Muscle'
    ];
    var parser = EmojiParser();
    var eyes = "🔥";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'What\'s\ your main goal?',
                style: TextStyle(fontSize: 20),
              ),
            ), 
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoseWight()));
      },
              child: Card(
                  child: ListTile(
                  leading: Icon(Icons.face),
                    title: Text('Lose Weight'),
                  ),
              ),
            ),
            InkWell(
              onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoseWight())),
              child: Card(
                  child: ListTile(
                    leading: Icon(Icons.monitor_weight_rounded),
                title: Text('Maintain Weight'),
              )
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoseWight()));
              },
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.fire),
                  title: Text('Build Muscles'),
                ),
              ),
            ),
            InkWell(
              onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoseWight())),
              child: Card(
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.arrowDownAZ),
                    title: Text('Gain Weight'),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
