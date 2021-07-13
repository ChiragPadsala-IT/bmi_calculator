import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  myTheme() {
    return ThemeData(
      indicatorColor: Colors.pink,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white10,
        splashColor: Colors.white70,
      ),
      textTheme: TextTheme(
        caption: TextStyle(
          fontSize: 24,
          color: CupertinoColors.white,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: TextStyle(
          fontSize: 20,
          color: CupertinoColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: IconThemeData(
        color: CupertinoColors.white,
        size: 24,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.pink),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20,
              color: CupertinoColors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 2)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      initialRoute: "/splash_screen",
      routes: {
        "/" : (context) => HomeScreen(),
        "/result_screen" : (context) => ResultScreen(),
        "/splash_screen" : (context) => SplashScreen(),
      },
    );
  }
}

