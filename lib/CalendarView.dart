import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartmirror/class/apiService.dart';

import 'class/constants.dart';

class CalendarView extends StatefulWidget {
  CalendarView({Key key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  String currentDate = "";
  String currentTime = "";
  List<Widget> calendarList = [];

  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
    getCalendar();
  }

  void updateTime() {
    DateTime dt = DateTime.now();

    setState(() {
      currentDate = DateFormat('dd/MM/yyyy').format(dt);
      currentTime = DateFormat('hh:mm:ss').format(dt);
    });
  }

  void getCalendar() async {
    List<Widget> _widgetList = [];

    var cal = await ApiService.getCalendar();
    cal.forEach((c) {
      DateTime start = DateTime.parse(c["start"]["dateTime"]);
      DateTime end = DateTime.parse(c["end"]["dateTime"]);

      _widgetList.add(Container(
        margin: EdgeInsets.all(10),
          child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Center(
              child: Icon(Icons.calendar_today_rounded,size: 20, color : Colors.white),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(c["summary"],
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(DateFormat('dd/MM/yyyy hh:mm -').format(start),
                  style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18)),
                  Text(DateFormat('hh:mm').format(end),
                  style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18))

                ],
              )
            ],
          ),
        ],
      )));
    });

    setState(() {
      calendarList = _widgetList;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currentTime,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold)),
          Text(currentDate,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 36,
                  fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: calendarList,
          )
        ],
      ),
    );
  }
}
