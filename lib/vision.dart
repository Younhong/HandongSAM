import 'package:flutter/material.dart';

class VisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('About Vision'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left:15, right:15, top:15, bottom: 20),
                child: Text("한동샘의 비전",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold))
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/final-exam-de688.appspot.com/o/vision.jpg?alt=media&token=73b49221-4564-45d5-b001-d96e65d8eae1",
                  fit: BoxFit.contain, height: 150),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 5),
              child: Text("한동샘의 비전 “Why Not Change the World” 는 1995년 정직과 성실을 교육의 핵심가치로 삼는 한동대학교의 슬로건입니다."
                  "뛰어난 교육을 받아서 고스펙과 경쟁으로 점철된 세상을 바꾸는 것이 아닌 평범하지만 치열한 일상에서 “배워서 남주는” 교육을 삶으로 실천하는 것이 한동대학교의 목표이자 꿈입니다.",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Text("한동샘 또한 마찬가지입니다. 한동샘은 정직하고 성실하게 제품을 만들고, 건전한 판매상식을 실천하고자 한동대학교가 선보이는 첫 고유브랜드입니다."
                  " 좋은 제품을 통해 여러분의 삶에 좋은 변화를 드리는 것, 한동샘의 본질적 가치이자 제일 우선되는 목표입니다. ",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                  "한동대학교의 연구기술 중심의 제품개발을 바탕으로 개발, 유통, 서비스 전 과정에 소비자의 니즈가 녹아들도록 노력하고 있습니다."
                  " 한동샘은 판매액의 일정부분을 한동대학교의 유엔아카데믹 임팩트(UNAI KOREA) 및 교육장학사업에 다시 환원하고 있습니다. 지역 커뮤니티, 그리고 청년과 학생들에게 위로와 힘이 될 수있도록 든든히 성장하겠습니다.",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}