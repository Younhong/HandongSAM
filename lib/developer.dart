import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('About Developer'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left:15, right:15, top:15, bottom: 20),
                child: Text("위드워터 개발자 소개", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text("빌헬름 홀잡펠 교수", style: TextStyle(fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/final-exam-de688.appspot.com/o/researcher.png?alt=media&token=a3c32303-2404-48cf-a75f-131df797f033", fit: BoxFit.contain, height: 300),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 7),
              child: Text("- 현 한동대학교 생명과학부/첨단그린에너지학과 교수", style: TextStyle(fontSize: 17)),
            ),
            Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 7),
                child: Text("- 현 국제미생물학회 연합(IUMS) 국제 식품미생물 및 위생위원회(ICFMH) 총재", style: TextStyle(fontSize: 17))
            ),
            Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 7),
                child: Text("- 현 국제 식품 미생물 저널 (The International Journal of Food Microbiology) 편집의원", style: TextStyle(fontSize: 17))
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 7),
              child: Text("- 전 독일위생 및 독물학 연구소 소장(1987-2007)", style: TextStyle(fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: Text("- 식품 미생물학, 식품 위생 및 산업 미생물학을 포함한 응용 미생물학과 관련 교육 및 연구경력 40년 석사 및 박사 과정 120여명 지도 325종의 과학 논문 출판, 70편의 과학 서적 집필, 8편 과학 서적 협동편집",
                  textAlign: TextAlign.justify, style: TextStyle(fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }
}