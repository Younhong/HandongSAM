import 'package:flutter/material.dart';

class TechPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('About Tech'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left:15, right:15, top:15, bottom: 20),
                child: Text("위드워터 기술력 소개",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text("유산균 선택의 기준",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 5),
              child: Text("- 좋은 유산균의 기준은 기본적으로 나에게 맞는 균주(유산균 종류)를 찾아서 몸에 무리가 되지 않는 적당한 양을 효과적인 전달방법을 통해서 먹는 것이 매우 중요합니다. "
                  "현재 유산균 시장에서 다양한 기능성 균주, 그리고 고함량의 균수에 집중하고 있는 이유가 여기에 있습니다. "
                  "위드워터는 또 하나의 기준, 유산균의 장내 전달방법인 “어떻게 먹는지”에 집중하여 양질의 유산균의 생존율을 높이는 특별한 방법을 적용했습니다.",
                style: TextStyle(
                    fontSize: 17),
                textAlign: TextAlign.justify,),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 5),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/final-exam-de688.appspot.com/o/tech1.jpeg?alt=media&token=3998d660-5fd6-448e-a13f-f7c9f2ab1939",
                  fit: BoxFit.contain,
                  height: 100),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text("동결건조 유산균의 한계",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 5),
              child: Text("- 동결건조 과정을 거친 프로바이오틱스 생균은 물이 제거되면서 세포 손상이 생기게 됩니다. 특히 건조된 분말을 바로 섭취할 경우 위산과 담즙산과 같은 산(Acid) 스트레스 환경에 바로 노출되면서 "
                  "손상을 입어 제 기능을 못하거나 죽기 쉽습니다. 뿐만 아니라, 세포벽에 손상을 입은 균은 장부착능력이 떨어져서 성공적인 장내 정착 및 유익균의 증식이 어렵게 됩니다.",
                  style: TextStyle(fontSize: 17),
                textAlign: TextAlign.justify,),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 5),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/final-exam-de688.appspot.com/o/tech2.jpg?alt=media&token=a7f24afc-7ebc-4c74-89be-18e619d6d874",
                  fit: BoxFit.contain, height: 100),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text("물에 타면 깨어나는 유산균, 위드워터",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 5),
              child: Text("- 홀잡펠 연구팀은 여러차례 실험을 통해서 장내전달방법이 생존력에 큰 영향을 미치는 것을 확인했습니다. "
                  "연구팀에서 직접 배양한 유산균과 자체개발한 특정배합원료를 물과 함께 넣었을때 유산균이 재활성화 되어 위산과 담즙산과 같은 스트레스 환경에서 생존율이 더 높고 장내 부착율이 높아졌습니다.",
                  style: TextStyle(fontSize: 17),
                textAlign: TextAlign.justify,),
            ),
          ],
        ),
      ),
    );
  }
}