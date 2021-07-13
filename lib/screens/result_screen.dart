import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {

    double _result = ModalRoute.of(context).settings.arguments;

    String _message1 ;
    String _message2 ;

    if(_result <= 5){
      _message1 = "Not Possible";
      _message2 = "Input value is wrong";
    }
    else if(_result < 18.5){
      _message1 = "UnderWeight";
      _message2 = "Your weight is low you should become healthy";
    }else if(_result >= 18.5 && _result <=24.9){
      _message1 = "Normal Weight";
      _message2 = "Your body is normal Good job";
    }else if(_result >=25 && _result<=29.9){
      _message1 = "OverWeight";
      _message2 = "Your body is not normal do exercise";
    }else{
      _message1 = "Obesity";
      _message2 = "Your weight is to high you must do exercise";
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Your BMI Result",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Expanded(
                flex: 10,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _message1,
                          style: TextStyle(
                              color: Colors.green[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              letterSpacing: 1),
                        ),
                        Text(_result.toStringAsFixed(2),style: TextStyle(color: Colors.white,fontSize: 70),),
                        Text(_message2,style: TextStyle(color: Colors.white70,fontSize: 24),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("RE CALCULATE"),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60)),
          ),
        ),
      ),
    );
  }
}
