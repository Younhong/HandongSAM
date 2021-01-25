import 'package:flutter/material.dart';
import 'package:flutter_app/diary.fourth.page.dart';
import 'package:flutter_app/daily.record.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class DiaryThirdPage extends StatefulWidget {
  final stressValue, drink, sleep;
  final morning, lunch, dinner;
  final alarmTime, userID, email, url;
  final DailyRecord dailyRecord;
  DiaryThirdPage({Key key, this.stressValue, this.drink, this.sleep, this.morning, this.lunch, this.dinner, this.userID, this.email, this.url, this.alarmTime, this.dailyRecord}) : super(key: key);
  DiaryThirdState createState() => DiaryThirdState(stressValue, drink, sleep, morning, lunch, dinner, userID, email, url, alarmTime, dailyRecord);
}

class DiaryThirdState extends State <DiaryThirdPage> {
  final stressValue, drink, sleep;
  final alarmTime, userID, email, url;
  final morning,lunch, dinner;
  final DailyRecord dailyRecord;
  DiaryThirdState(this.stressValue, this.drink, this.sleep, this.morning, this.lunch, this.dinner, this.userID, this.email, this.url, this.alarmTime, this.dailyRecord);

  String _bioEat = '';
  String eatHourEval = "";

  DateTime _eatenHour = DateTime.now();

  Widget build(BuildContext context) {
    String title = (dailyRecord.countDay+1).toString() + "일차 장일기 3/4";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding:EdgeInsets.only(left:20,top:20),
            alignment: Alignment.topLeft,
            child: Text("* 유산균 섭취 여부",
                style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
          ),
          Column(
            children: <Widget>[
              Container(
                  height:50,
                  padding:const EdgeInsets.all(15),
                  child:Row(
                    children: <Widget>[
                      Radio(
                        value:'1',
                        groupValue: _bioEat,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _bioEat=value),),
                      Text('Yes'),
                    ],
                  )
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                  height:50,
                  padding:const EdgeInsets.all(15),
                  child:Row(
                    children: <Widget>[
                      Radio(value: '0',
                        groupValue: _bioEat,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _bioEat=value),),
                      Text('No'),
                    ],
                  )
              )
            ],
          ),
          Container(
            padding:EdgeInsets.only(left:20,top: 5, bottom: 5),
            alignment: Alignment.topLeft,
            child: Text("* 유산균 섭취 시간",
                style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
          ),
          hourMinute12HCustomStyle(),
          Container(
            padding: EdgeInsets.only(top:10, bottom: 5),
            child: FlatButton(
              onPressed: ()=> Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      DiaryFourthPage(
                        stressValue: stressValue, drink:drink, sleep: sleep,
                        morning: morning, lunch: lunch, dinner: dinner,
                        bioEat: _bioEat, eatenHour: _eatenHour,
                        userID: userID, email: email, url: url,
                        alarmTime: alarmTime, dailyRecord: dailyRecord)
              )),
              textColor: Colors.white,
              child: Container(
                padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.indigo,
                      Colors.indigoAccent,
                      Colors.indigo,
                    ],
                  ),),
                child: const Text('Next', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget hourMinute12HCustomStyle(){
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24, color: Colors.black45
      ),
      highlightedTextStyle: TextStyle(
        fontSize: 35,
        color: Colors.black,
      ),
      spacing: 30,
      itemHeight: 40,
      isForce2Digits: true,
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _eatenHour = time;
        });
      },
    );
  }
}