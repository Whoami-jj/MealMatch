import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_match/Admin/admin_screen.dart';
import 'package:meal_match/Admin/show_data.dart';
import 'package:meal_match/get_started_screen.dart';
import 'package:meal_match/login.dart';
import 'package:meal_match/signup.dart';
import 'package:meal_match/splash_screen.dart';

import 'dashboard.dart';
import 'email_forget_pass.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent,
          brightness: Brightness.light,
          primarySwatch: Colors.green),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent,
      themeMode: ThemeMode.system,
      home:

          // ShowData(),
          // AdminPanel(),
          // DashBoard(),
          SplashScreen(),
      //     Login(),
      // EmailForgetPass(),
      //     MyHomePage(
      //   title: 'Meal Match',
      // ),
      // WalkthroughScreen(),
      // DashBoard(),
      // HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 400,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Reaching Your Weight Goal Has\nNever Been This Easy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login())),
                        child: Text('Login'),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetStartedScreen()));
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
