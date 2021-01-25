import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/daily.record.dart';
import 'package:flutter_app/home.dart';

class ResultPage extends StatefulWidget {
  final stressValue, drink, sleep;
  final morning, lunch, dinner;
  final bioEat, eatenHour;
  final userID, email, url;
  final dumpCount, comfortValue, dumpStatus;
  final alarmTime;
  final DailyRecord record;
  ResultPage({Key key, this.stressValue, this.drink, this.sleep, this.morning,
    this.lunch, this.dinner, this.bioEat, this.eatenHour,
    this.dumpCount, this.comfortValue, this.dumpStatus, this.userID, this.email,
    this.url, this.alarmTime, this.record}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState(
      stressValue, drink, sleep, morning, lunch, dinner, bioEat, eatenHour,
      dumpCount, comfortValue, dumpStatus, userID, email, url, alarmTime, record);
}

class _ResultPageState extends State<ResultPage> {
  final stressValue, drink, sleep;
  final morning, lunch, dinner;
  final bioEat, eatenHour;
  final userID, email, url;
  final dumpCount, comfortValue, dumpStatus;
  final alarmTime;
  final DailyRecord record;
  _ResultPageState(
      this.stressValue, this.drink, this.sleep, this.morning, this.lunch, this.dinner,
      this.bioEat, this.eatenHour, this.dumpCount, this.comfortValue, this.dumpStatus,
      this.userID, this.email, this.url, this.alarmTime, this.record);
  @override

  Widget build(BuildContext context) {
    String _drink = "";
    String _eat = "";
    if (drink == "1") {
      _drink = "Yes";
    }
    else {
      _drink = "No";
    }
    if (bioEat == "1") {
      _eat = "Yes";
    }
    else {
      _eat = "No";
    }

    String timeMatch = "";

    if (record.alarmTime.toDate().difference(eatenHour).inHours%24 > 1) {
      timeMatch = "시간 꼭 지켜주세요";
    }
    else {
      timeMatch = "유산균 시간 OK";
    }
    String _morning,_lunch,_dinner="";
    if (morning == "1") { _morning = "안 먹음"; }
    else if(morning == "2") { _morning = "간식"; }
    else if(morning == "3") { _morning = "인스턴트"; }
    else if(morning == "4") { _morning = "채식"; }
    else if(morning == "5") { _morning = "탄수화물"; }
    else if(morning == "6") { _morning = "지방"; }
    else { _morning = "단백질"; }

    if (lunch == "1") { _lunch = "안 먹음"; }
    else if(lunch == "2") { _lunch = "간식"; }
    else if(lunch == "3") { _lunch = "인스턴트"; }
    else if(lunch == "4") { _lunch = "채식"; }
    else if(lunch == "5") { _lunch = "탄수화물"; }
    else if(lunch == "6") { _lunch = "지방"; }
    else { _lunch = "단백질"; }

    if (dinner == "1") { _dinner = "안 먹음"; }
    else if(dinner == "2") { _dinner = "간식"; }
    else if(dinner == "3") { _dinner = "인스턴트"; }
    else if(dinner == "4") { _dinner = "채식"; }
    else if(dinner == "5") { _dinner = "탄수화물"; }
    else if(dinner == "6") { _dinner = "지방"; }
    else { _dinner = "단백질"; }

    String title = (record.countDay+1).toString() + "일차 설문조사 결과";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: <Widget>[
            GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        "스트레스 정도",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        stressValue,
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.indigo),),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("음주 여부",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                          _drink,
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.indigo)),
                    ),
                  ],
                ),
              ),
              Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        child: Text("수면 시간",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(sleep,
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.indigo),),
                      ),
                    ],
                  ),
              ),
              Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        child: Text("아침 식단",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: Text(_morning,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),),
                      ),
                    ],
                  ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("점심 식단",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(_lunch,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("저녁 식단",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(_dinner,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("유산균 섭취 여부",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(_eat,
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.indigo)),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("유산균 섭취 시간",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 55),
                    Container(
                      child: Text(timeMatch,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo)),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("배변 상태",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Image.asset(
                          'assets/$dumpStatus.png',
                          width: 150),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text("배변감",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(comfortValue,
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.indigo)),
                    ),
                  ],
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
                  child: Text("Submit",
                    style: TextStyle(
                        color: Colors.white),
                    textAlign: TextAlign.center,),
                ),
                onPressed: () {
                  if (record.countDay == 0) {
                    record.reference.updateData({
                      "initialTime": DateTime.now(),
                    });
                  }
                  else if (record.countDay == 13) {
                    record.reference.updateData({
                      "lastSubmitTime": DateTime.now(),
                    });
                  }
                  record.reference.updateData({
                    "stressValue": record.stressValue + stressValue,
                    "drink": FieldValue.increment(int.parse(drink)),
                    "sleep": FieldValue.increment(int.parse(sleep)),
                    "morning": record.morning + morning,
                    "lunch": record.lunch + lunch,
                    "dinner": record.dinner + dinner,
                    "bioEat": FieldValue.increment(int.parse(bioEat)),
                    "dumpStatus": FieldValue.increment(int.parse(
                        dumpStatus)),
                    "comfortValue": record.comfortValue + comfortValue,
                    "dumpCount": record.dumpCount + dumpCount,
                    "countDay": FieldValue.increment(1),
                    "submitTime": DateTime.now(),
                  });
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          HomePage(
                            userID: userID,
                            email: email,
                            url: url,
                            alarmTime: alarmTime,)),);
                }
            ),
          ),
          ],
        ),
    );
  }
}
