import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  Duration _duration = Duration(milliseconds: 5000);

  @override
  void initState() {
    Timer(_duration,(){
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: Container(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/health.jpg",
                    ),
                    radius: MediaQuery.of(context).size.width / 7.5,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "BMI CALCULATOR",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SpinKitFadingCube(
                    itemBuilder: (context,int){
                      return DecoratedBox(decoration: BoxDecoration(color: Colors.pink));
                    },
                    size: 50.0,

                  ),
                  SizedBox(height: 20),
                  Text(
                    "Check Your BMI",
                    style: TextStyle(color: Colors.white60,fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
