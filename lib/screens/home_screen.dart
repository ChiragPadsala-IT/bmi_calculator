import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  static double _height = 0;
  static int _weight = 0;
  static int _age = 0;
  static String _gen = "";
  static Color _maleColor = Colors.white70;
  static Color _femaleColor = Colors.white70;
  static AnimationController _controller;
  static Animation _animation1;
  static Animation _animation2;
  static Animation _animation3;
  static Animation _animation4;
  static final Color _myColor = Colors.black54;


  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    _animation1 = Tween<Offset>(begin: Offset(-1,0),end: Offset(0,0)).animate(_controller);
    _animation2 = Tween<Offset>(begin: Offset(1,0),end: Offset(0,0)).animate(_controller);
    _animation3 = Tween<Offset>(begin: Offset(0,-1),end: Offset(0,0)).animate(_controller);
    _animation4 = Tween<Offset>(begin: Offset(0,1),end: Offset(0,0)).animate(_controller);
    _controller.forward();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideTransition(
                position: _animation3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BMI CALCULATOR",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          setState(() {
                            _gen = "";
                            _height = 0;
                            _weight = 0;
                            _age = 0;
                            _maleColor = Colors.white70;
                            _femaleColor = Colors.white70;
                          });
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideTransition(
                    position: _animation1,
                    child: InkWell(
                      onTap: () {
                        if (_maleColor == Colors.white70) {
                          setState(() {
                            _maleColor = Colors.pink;
                            _femaleColor = Colors.white70;
                            _gen = "Male";
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: _myColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/male.png",
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                              color: _maleColor,
                              scale: 0.1,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Male",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _animation2,
                    child: InkWell(
                      onTap: () {
                        if (_femaleColor == Colors.white70) {
                          setState(() {
                            _femaleColor = Colors.pink;
                            _maleColor = Colors.white70;
                            _gen = "Female";
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: _myColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/female.png",
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                              color: _femaleColor,
                              scale: 1,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Female",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SlideTransition(
                position: _animation2,
                child: Container(
                  height: MediaQuery.of(context).size.width / 2.5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: _myColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${_height.toInt()}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Slider(
                        value: _height,
                        min: 0,
                        max: 200,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.pink[100],
                        onChanged: (val) {
                          setState(() {
                            _height = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideTransition(
                    position: _animation1,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: _myColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$_weight",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  if (_weight < 200) {
                                    setState(() {
                                      _weight++;
                                    });
                                  }
                                },
                                child: Icon(Icons.add),
                                heroTag: "_addBtn",
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (_weight > 0) {
                                    setState(() {
                                      _weight--;
                                    });
                                  }
                                },
                                child: Icon(Icons.remove),
                                heroTag: "_subBtn",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _animation2,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: _myColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$_age",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  if (_age < 150) {
                                    setState(() {
                                      _age++;
                                    });
                                  }
                                },
                                child: Icon(Icons.add),
                                heroTag: "_addAge",
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (_age > 0) {
                                    setState(() {
                                      _age--;
                                    });
                                  }
                                },
                                child: Icon(Icons.remove),
                                heroTag: "_subAge",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SlideTransition(
          position: _animation4,
          child: ElevatedButton(
            onPressed: () {
              if (_age == 0 || _weight == 0 || _height == 0 || _gen == "") {
                ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
                  SnackBar(
                    content: Text("Enter all value"),
                  ),
                );
              }else{
                double _meter = _height/100;
                double _result = _weight/(_meter * _meter);
                ScaffoldMessenger.of(context)..removeCurrentSnackBar();
                Navigator.of(context).pushNamed("/result_screen",arguments: _result);
              }
            },
            child: Text("CALCULATE YOUR BMI"),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
            ),
          ),
        ),
      ),
    );
  }
}
