import 'package:flutter/material.dart';
import 'developer.dart';
import 'tech.dart';
import 'vision.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('About HandongSAM'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text("한동샘 이야기", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(left: 110, right: 110, top:20),
              child: FlatButton(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.indigo,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ],
                    ),),
                  child: Text("위드워터 개발자 소개", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DeveloperPage())),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:110, right:110, top: 15),
              child: FlatButton(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.indigo,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ],
                    ),),
                  child: Text("위드워터의 기술력", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TechPage())),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:110, right:110, top:15),
              child: FlatButton(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.only(left:10, right:10, top:5, bottom: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.indigo,
                        Colors.indigoAccent,
                        Colors.indigo,
                      ],
                    ),),
                  child: Text("한동샘의 비전", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VisionPage())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}