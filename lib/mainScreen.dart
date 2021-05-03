import 'package:flutter/material.dart';
import 'package:smartmirror/CalendarView.dart';
import 'package:smartmirror/class/WeatherView.dart';
import 'package:smartmirror/newsView.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double opacity = 1;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            margin: EdgeInsets.all(25),
            constraints: BoxConstraints.expand(),
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: visible ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 400,
                        height: 700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CalendarView(),
                            Flexible(
                              child: ListView(
                                children: [WeatherView(), NewsView()],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
