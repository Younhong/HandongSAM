import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/daily.record.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmPage extends StatefulWidget {
  final email;
  final url;
  final userID;
  AlarmPage({Key key, @required this.userID, @required this.email, @required this.url}) : super(key: key);
  @override
  _AlarmPageState createState() => _AlarmPageState(userID, email, url);
}

class _AlarmPageState extends State<AlarmPage> {
  final email;
  final url;
  final userID;
  DailyRecord record;

  DateTime _dateTime = DateTime.now();

  _AlarmPageState(this.userID, this.email, this.url);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Alarm Setting'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 70),
                hourMinute12HCustomStyle(),
                new Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: new Text('현재 설정된 알람 시간:\n    ' +
                      _dateTime.hour.toString().padLeft(2, '0') + '시 ' +
                      _dateTime.minute.toString().padLeft(2, '0') + '분입니다.',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 240, top: 30, right: 60),
              child: FlatButton(
                  child: Container(
                    width: 80,
                    padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.indigo,
                          Colors.indigoAccent,
                          Colors.indigo,
                        ],
                      ),),
                    child: Text("저장",
                      style: TextStyle(
                          color: Colors.white),
                      textAlign: TextAlign.center,),
                  ),
                  onPressed: () {
                    Firestore.instance.collection("Daily_Record")
                        .document(userID).updateData({"alarmTime": _dateTime,});
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          HomePage(userID: userID, email: email,
                            url: url, alarmTime: _dateTime,)),
                    );}
              ),),
          ],
        ),
      ),
    );
  }

  Widget hourMinute12HCustomStyle(){
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.black45
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 35,
          color: Colors.black
      ),
      spacing: 30,
      itemHeight: 70,
      isForce2Digits: true,
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}