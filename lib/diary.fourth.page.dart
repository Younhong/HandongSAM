import 'package:flutter/material.dart';
import 'package:flutter_app/daily.record.dart';
import 'package:flutter_app/result.dart';

class DiaryFourthPage extends StatefulWidget {
  final stressValue, drink, sleep;
  final morning, lunch, dinner;
  final bioEat, eatenHour;
  final userID, email, url;
  final alarmTime;
  final DailyRecord dailyRecord;
  DiaryFourthPage({Key key, this.stressValue, this.drink, this.sleep, this.morning, this.lunch, this.dinner, this.bioEat, this.eatenHour, this.userID, this.email, this.url, this.alarmTime, this.dailyRecord}) : super(key: key);
  DiaryFourthState createState() => DiaryFourthState(stressValue, drink, sleep, morning, lunch, dinner, bioEat, eatenHour, userID, email, url, alarmTime, dailyRecord);
}

class DiaryFourthState extends State <DiaryFourthPage> {
  final stressValue, drink, sleep;
  final morning,lunch, dinner;
  final bioEat, eatenHour;
  final userID, email, url;
  final alarmTime;
  final DailyRecord dailyRecord;
  DiaryFourthState(this.stressValue, this.drink, this.sleep, this.morning, this.lunch, this.dinner, this.bioEat, this.eatenHour, this.userID, this.email, this.url, this.alarmTime, this.dailyRecord);

  double _comfortValue = 0.0;
  String _dumpCount = '';
  String _dumpStatus = '';

  void _setValue2(double value) => setState(() => _comfortValue = value);

  Widget build(BuildContext context) {
    String title = (dailyRecord.countDay+1).toString() + "일차 장일기 4/4";
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
            child: Text("* 배변 횟수",
                style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
          ),
          Column(
            children: <Widget>[
              Container(
                  height:50,
                  padding:const EdgeInsets.all(15),
                  child:Row(
                    children: <Widget>[
                      Radio(
                        value:'0',
                        groupValue: _dumpCount,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpCount=value),),
                      Text('0회',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Radio(
                        value:'1',
                        groupValue: _dumpCount,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpCount=value),),
                      Text('1회',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Radio(
                        value:'2',
                        groupValue: _dumpCount,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpCount = value),),
                      Text('2회',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Radio(
                        value:'3',
                        groupValue: _dumpCount,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpCount = value),),
                      Text('3회',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Radio(
                        value:'4',
                        groupValue: _dumpCount,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpCount = value),),
                      Text('4회',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Radio(
                        value:'5',
                        groupValue: _dumpCount,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpCount = value),),
                      Text('5회',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text("* 배변감",
                style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
          ),
          Slider(
              value: _comfortValue,
              onChanged: _setValue2,
              activeColor: Colors.indigo[900],
              inactiveColor: Colors.indigo),
          Container(
            padding: const EdgeInsets.only(left: 340, top: 5),
            child: Text('${(_comfortValue*4 + 1).round()}',),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 5),
            alignment: Alignment.topLeft,
            child: Text("* 배변싱태",
                style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value:'1',
                        groupValue: _dumpStatus,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpStatus=value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/1.png', width: 150, height: 150),
                    ),
                    Container(
                      child: Radio(value:'2',groupValue: _dumpStatus, activeColor: Colors.indigo, onChanged: (value)=>setState(()=>_dumpStatus=value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/2.png', width: 150, height: 150),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value:'3',
                        groupValue: _dumpStatus,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpStatus=value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/3.png', width: 150, height: 150),
                    ),
                    Container(
                      child: Radio(
                        value:'4',
                        groupValue: _dumpStatus,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpStatus=value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/4.png', width: 150, height: 150),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value:'5',
                        groupValue: _dumpStatus,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpStatus=value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/5.png', width: 150, height: 150),
                    ),
                    Container(
                      child: Radio(
                        value:'6',
                        groupValue: _dumpStatus,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpStatus=value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/6.png', width: 150, height: 150),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value:'7',
                        groupValue: _dumpStatus,
                        activeColor: Colors.indigo,
                        onChanged: (value) =>
                            setState(() => _dumpStatus = value),),
                    ),
                    Container(
                      child: Image.asset(
                          'assets/7.png', width: 150, height: 150),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:10, bottom: 5),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                      ResultPage(
                          stressValue: stressValue, drink: drink, sleep: sleep,
                          morning: morning, lunch: lunch, dinner: dinner,
                          bioEat: bioEat, eatenHour: eatenHour,
                          dumpCount: _dumpCount, comfortValue: (_comfortValue * 4 + 1).round().toString(), dumpStatus: _dumpStatus,
                          userID: userID, email: email, url: url,
                          alarmTime: alarmTime, dailyRecord: dailyRecord)));
              },
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
                child: const Text('Confirm',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}