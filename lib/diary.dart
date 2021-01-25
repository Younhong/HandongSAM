import 'package:flutter/material.dart';
import 'package:flutter_app/diary.second.page.dart';
import 'package:flutter_app/daily.record.dart';

class DiaryPage extends StatefulWidget {
  final alarmTime;
  final userID, email, url;
  final DailyRecord record;
  DiaryPage({Key key, this.userID, this.email, this.url, this.alarmTime, this.record}) : super(key: key);

  DiaryState createState() => DiaryState(
      userID, email, url, alarmTime, record);
}

class DiaryState extends State <DiaryPage> {
  final alarmTime;
  final userID, email, url;
  final DailyRecord record;
  DiaryState(this.userID, this.email, this.url, this.alarmTime, this.record);

  double _stressValue = 0.0;
  String _drink = "";
  final _sleepHourController = TextEditingController();

  void _setValue(double value) => setState(() => _stressValue = value);

  Widget build(BuildContext context) {
    String title = (record.countDay+1).toString() + "일차 장일기 1/4";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 30),
            alignment: Alignment.topLeft,
            child: Text("* 스트레스 지수",
                style:TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold)),
          ),
          Slider(
              value: _stressValue,
              onChanged: _setValue,
              activeColor: Colors.indigo[900],
              inactiveColor: Colors.indigo),
          Container(
            padding: const EdgeInsets.only(left: 340, top: 5),
            child: Text('${(_stressValue*4 + 1).round()}',
                style:TextStyle(
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding:EdgeInsets.only(left:10,top:20),
            alignment: Alignment.topLeft,
            child: Text("* 음주 여부",
                style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
          ),
          Column(
            children: <Widget>[
              Container(
                  height:50,
                  padding:const EdgeInsets.all(15),
                  child:Row(
                    children: <Widget>[
                      Radio(
                        value:"1",
                        groupValue: _drink,
                        activeColor: Colors.indigo,
                        onChanged: (value) => setState(()=>_drink=value),),
                      Text('Yes',style:TextStyle(fontWeight: FontWeight.bold)),
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
                        value:"0",
                        groupValue: _drink,
                        activeColor: Colors.indigo,
                        onChanged: (value)=>setState(() => _drink=value),),
                      Text('No',
                          style:TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
              )
            ],
          ),
          Container(
            padding:EdgeInsets.only(left:10,top:5, bottom: 5),
            alignment: Alignment.topLeft,
            child: Text("* 수면 시간",
                style:TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return '수면시간을 입력해주세요';
                }
                return null;
              },
              controller: _sleepHourController,
              decoration: InputDecoration(
                filled: true,
                labelText: '숫자만 입력해주세요',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:10, bottom: 5),
            child: FlatButton(
              onPressed: ()=> Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      DiarySecondPage(
                          stressValue: (_stressValue*4 + 1).round().toString(),
                          drink:_drink,
                          sleep: _sleepHourController.text,
                          userID: userID,
                          email: email, url: url,
                          alarmTime: alarmTime, record: record)
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
}