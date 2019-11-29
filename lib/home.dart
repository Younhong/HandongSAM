import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'record2.dart';
import 'profile.dart';
import 'record.dart';
import 'detail.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'intro.dart';
import 'diary.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'visual.dart';
import 'web.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  final userID, email, url, alarmTime;
  HomePage({Key key, @required this. userID, @required this.email, this.url, this.alarmTime}) : super(key: key);
  HomeState createState() => HomeState(userID, email, url, alarmTime);
}

class HomeState extends State<HomePage> {
  final userID, email, url;
  DateTime alarmTime;
  HomeState(this.userID, this.email, this.url, this.alarmTime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('HandongSAM'),
      ),
      body:  ListView(
        children: <Widget>[
          _buildBody(context, _selectedIndex),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(backgroundImage: NetworkImage(url),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(email, style: TextStyle(color: Colors.white, fontSize: 19)),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home, color: Colors.indigo),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: Text("About HandongSAM"),
                leading: Icon(Icons.info, color: Colors.indigo),
                onTap: () {
                  _signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
                }
            ),
            ListTile(
                title: Text("My Page"),
                leading: Icon(Icons.account_circle, color: Colors.indigo),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(email: email, url: url)));
                }
            ),
            ListTile(
                title: Text("Log Out"),
                leading: Icon(Icons.exit_to_app, color: Colors.indigo),
                onTap: () {
                  _signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                }
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Diary'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Result'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  void _signOut() async {
    await _auth.signOut();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody(BuildContext context, int index) {
    if (index == 0) {
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("Product_Info").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data.documents);
        },
      );
    }
    else if (index == 1) {
      return _buildAlarm(context);
    }
    else if (index == 2) {
      return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection("Daily_Record").document(userID).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildDiary(context, snapshot.data);
        },
      );
    }
    else{
      return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection("Daily_Record").document(userID).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) return LinearProgressIndicator();
          return _buildResult(context,snapshot.data);
        },
      );
    }
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Column(
      children: <Widget>[
        Container(
            height: 120,
            padding: EdgeInsets.only(top: 40),
            child: Text("HandongSAM Product", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
        ),
        GridView.count (
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: snapshot.map((data) => _buildListItem(context, data)).toList(),
        )
      ],
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final record = Record.fromSnapshot(data);
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(
                '${record.image}',
                fit: BoxFit.contain,
                width: 200,
                height: 100,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top:10, left: 20),
              child: Text(
                record.name,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                softWrap: true,
              ),),
            Container(
              padding: const EdgeInsets.only(top:2, left: 20),
              child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        record.price.toString(),
                        style: TextStyle(fontSize: 9.0),
                        softWrap: true,
                      ),)
                  ]
              ),
            ),
            Container(
              height: 55,
              padding: const EdgeInsets.only(left: 100),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    child: Text('More', style: TextStyle(fontSize: 12, color: Colors.blue),),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(record: record, userID: userID, docID: data.documentID))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlarm(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height:20),
        Container(
          padding: EdgeInsets.only(top:10),
          child: Text("현재 설정된 알람 시간은 " + alarmTime.hour.toString().padLeft(2, '0') + '시 ' + alarmTime.minute.toString().padLeft(2, '0') + '분입니다.',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                child: hourMinute12HCustomStyle(),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top:10),
          child: Text("변경된 알람을 저장하시겠습니까?",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 120, top: 10),
              child: FlatButton(
                child: Container(
                  width: 50,
                  padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.indigo,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ],
                    ),),
                  child: Text("취소", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userID: userID, email: email, url: url, alarmTime: alarmTime)),
                ),),),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: FlatButton(
                child: Container(
                  width: 50,
                  padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.indigo,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ],
                    ),),
                  child: Text("저장", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                ),
                onPressed: ()  {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          child: Text("알람 시간 변경"),
                        ),
                        content:
                        SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("새로 설정한 알람 시간은 " + _dateTime.hour.toString().padLeft(2, '0') + '시 ' + _dateTime.minute.toString().padLeft(2, '0') + '분입니다.',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 30, left: 120),
                                    child: FlatButton(
                                        child: Text('Cancel', style: TextStyle(color: Colors.blue)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    padding: EdgeInsets.only(top: 30),
                                    child: FlatButton(
                                        child: Text('Save', style: TextStyle(color: Colors.blue)),
                                        onPressed: () {
                                          alarmTime = _dateTime;
                                          Firestore.instance.collection("Daily_Record").document(userID).updateData({"alarmTime": alarmTime});
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userID: userID, email: email, url: url, alarmTime: alarmTime,)));
                                        }
                                    ),
                                  ),
                                ],
                            ),],
                          ),
                        ),
                      );
                    },);
                },
              ),),
          ],
        ),
      ],
    );
  }

  DateTime _dateTime = DateTime.now();
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
      itemHeight: 50,
      isForce2Digits: true,
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget _buildDiary(BuildContext context, snapshot) {
    final DailyRecord record2 = DailyRecord.fromSnapshot(snapshot);
    return Column(
      children: <Widget>[
        SizedBox(height:200),
        Container(
          child: Text("건강한 습관을 들이기 위한 장일기", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),
        SizedBox(height: 10),
        Container(
          child: FlatButton(
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
                child: Text("장일기 작성", style: TextStyle(fontSize: 20),),
              ),
              onPressed: () {
                if (record2.countDay >= 1 && record2.countDay < 14) {
                  if (record2.submitTime.toDate().day == DateTime.now().day) {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Container(
                            child: Text('오늘의 설문조사를 이미 완료하셨습니다.'),
                          ),
                          content:
                          SingleChildScrollView(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 30, left: 180),
                                  child: FlatButton(
                                      child: Text('Cancel', style: TextStyle(color: Colors.blue)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }
                                  ),
                                ),
                              ],
                            ),),
                        );
                      },);
                  }
                  else Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryPage(userID: userID, email: email, url: url, alarmTime: alarmTime, record: record2)));
                }
                else if (record2.countDay == 14) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          child: Text('14회의 설문조사를 모두 완료하셨습니다.'),
                        ),
                        content:
                        SingleChildScrollView(
                          child:  Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    child: FlatButton(
                                        child: Text('Cancel', style: TextStyle(color: Colors.blue, fontSize: 12)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    child: FlatButton(
                                        child: Text('결과분석', style: TextStyle(color: Colors.blue, fontSize: 12)),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => VisualPage(userID: userID, email: email, url: url, alarmTime: alarmTime, record: record2)));
                                        }
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    child: FlatButton(
                                        child: Text('초기화', style: TextStyle(color: Colors.blue, fontSize: 12)),
                                        onPressed: () {
                                          record2.reference.updateData({"stressValue": "", "drink": 0, "sleep": 0,
                                            "morning": "", "lunch": "", "dinner": "",
                                            "bioEat": 0, "dumpStatus": 0,
                                            "comfortValue": "", "dumpCount": "", "countDay": 0});
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userID: userID, email: email, url: url, alarmTime: alarmTime)));
                                        }
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    child: FlatButton(
                                        child: Text('구매', style: TextStyle(color: Colors.blue, fontSize: 12)),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => WebPage()));
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },);
                }
                else
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryPage(userID: userID, email: email, url: url, alarmTime: alarmTime, record: record2)));
              }
          ),
        ),
      ],
    );
  }

  Widget _buildResult(BuildContext context, snapshot) {
    final DailyRecord record2 = DailyRecord.fromSnapshot(snapshot);
    return Column(
      children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text("매일매일 확인하는 내 장건강", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),
        SizedBox(height: 10),
        Container(
          child: FlatButton(
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
                child: Text("장일기 분석", style: TextStyle(fontSize: 20),),
              ),
              onPressed: () {
                if (record2.countDay > 0) {
                  if (record2.countDay <= 13) {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Container(
                            child: Text('아직 장일기를 완료하지 않았습니다. 결과를 확인하시겠습니까?'),
                          ),
                          content:
                          SingleChildScrollView(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 30, left: 100),
                                  child: FlatButton(
                                      child: Text('Cancel', style: TextStyle(color: Colors.blue)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  padding: EdgeInsets.only(top: 30),
                                  child: FlatButton(
                                      child: Text('결과분석', style: TextStyle(color: Colors.blue)),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => VisualPage(userID: userID, email: email, url: url, alarmTime: alarmTime, record: record2)));
                                      }
                                  ),
                                ),
                              ],
                            ),),
                        );
                      },);
                  }
                  else
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VisualPage(userID: userID, email: email, url: url, alarmTime: alarmTime, record: record2)));
                }
                else {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          child: Text('첫 방문이신가요? 기록된 데이터가 없습니다.'),
                        ),
                        content:
                        SingleChildScrollView(
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 30, left: 80),
                                child: FlatButton(
                                    child: Text('Cancel', style: TextStyle(color: Colors.blue)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 30),
                                child: FlatButton(
                                    child: Text('장일기로 이동', style: TextStyle(color: Colors.blue)),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryPage(userID: userID, email: email, url: url, alarmTime: alarmTime, record: record2)));
                                    }
                                ),
                              ),
                            ],
                          ),),
                      );
                    },);
                }
              }
          ),
        ),
      ],
    );
  }
}