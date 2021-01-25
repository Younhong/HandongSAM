import 'package:flutter/material.dart';
import 'package:flutter_app/daily.record.dart';
import 'package:flutter_app/diary.third.page.dart';

class DiarySecondPage extends StatefulWidget {
  final stressValue, drink, sleep;
  final alarmTime, userID, email, url;
  final DailyRecord dailyRecord;
  DiarySecondPage({Key key, this.stressValue, this.drink, this.sleep, this.userID, this.email, this.url, this.alarmTime, this.dailyRecord}) : super(key: key);
  DiarySecondState createState() => DiarySecondState(stressValue, drink, sleep, userID, email, url, alarmTime, dailyRecord);
}

class DiarySecondState extends State <DiarySecondPage> {
  final stressValue, drink, sleep;
  final alarmTime, userID, email, url;
  final DailyRecord dailyRecord;
  DiarySecondState(this.stressValue, this.drink, this.sleep, this.userID, this.email, this.url, this.alarmTime, this.dailyRecord);

  String _morning = '';
  String _lunch = '';
  String _dinner = '';

  Widget build(BuildContext context) {
    String title = (dailyRecord.countDay+1).toString() + "일차 장일기 2/4";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text("* 아침 주요 식단",
              style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Radio(value: '1',
                      groupValue: _morning,
                      activeColor: Colors.indigo[900],
                      onChanged: (value) =>
                          setState(() => _morning = value),),
                    Text('안 먹음',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '2',
                        groupValue: _morning,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) => setState(() => _morning = value),),
                    ),
                    Text('시리얼 또는 간식',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '3',
                        groupValue: _morning,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) => setState(() => _morning = value),),
                    ),
                    Text('인스턴트',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '4',
                        groupValue: _morning,
                        activeColor: Colors.indigo[900], onChanged: (value) => setState(() => _morning = value),),
                    ),
                    Text('채식위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '5',
                        groupValue: _morning,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _morning = value),),
                    ),
                    Text('탄수화물 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '6',
                        groupValue: _morning,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _morning = value),),
                    ),
                    Text('지방 위주 반찬',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '7',
                        groupValue: _morning,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _morning = value),),
                    ),
                    Text('단백질 위주 반찬',
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text("* 점심 주요 식단",
                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: '1',
                      groupValue: _lunch,
                      activeColor: Colors.indigo[900],
                      onChanged: (value) =>
                          setState(() => _lunch = value),),
                    Text('안 먹음',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '2',
                        groupValue: _lunch,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _lunch = value),),
                    ),
                    Text('시리얼 또는 간식',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '3',
                        groupValue: _lunch,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _lunch = value),),
                    ),
                    Text('인스턴트',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '4',
                        groupValue: _lunch,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _lunch = value),),
                    ),
                    Text('채식위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '5',
                        groupValue: _lunch,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _lunch = value),),
                    ),
                    Text('탄수화물 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '6',
                        groupValue: _lunch,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _lunch = value),),
                    ),
                    Text('지방 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '7',
                        groupValue: _lunch,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _lunch = value),),
                    ),
                    Text('단백질 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text("* 저녁 주요 식단",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: '1',
                      groupValue: _dinner,
                      activeColor: Colors.indigo[900],
                      onChanged: (value) =>
                          setState(() => _dinner = value),),
                    Text('안 먹음',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '2',
                        groupValue: _dinner,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _dinner = value),),
                    ),
                    Text('시리얼 또는 간식',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '3',
                        groupValue: _dinner,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _dinner = value),),
                    ),
                    Text('인스턴트',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '4',
                        groupValue: _dinner,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _dinner = value),),
                    ),
                    Text('채식위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '5',
                        groupValue: _dinner,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _dinner = value),),
                    ),
                    Text('탄수화물 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '6',
                        groupValue: _dinner,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _dinner = value),),
                    ),
                    Text('지방 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Radio(
                        value: '7',
                        groupValue: _dinner,
                        activeColor: Colors.indigo[900],
                        onChanged: (value) =>
                            setState(() => _dinner = value),),
                    ),
                    Text('단백질 위주',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top:10, bottom: 5),
            child: FlatButton(
              onPressed: ()=> Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      DiaryThirdPage(
                        stressValue: stressValue, drink:drink, sleep: sleep,
                        morning: _morning, lunch: _lunch, dinner: _dinner,
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
}