import 'package:flutter/material.dart';
import 'record2.dart';
import 'home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

class VisualPage extends StatefulWidget {
  final DailyRecord record;
  final userID, email, url, alarmTime;
  VisualPage({Key key, this.userID, this.email, this.url, this.alarmTime, this.record}) : super(key: key);
  @override
  VisualState createState() => VisualState(userID, email, url, alarmTime, record);
}

class VisualState extends State<VisualPage> {
  final DailyRecord record;
  final userID, email, url, alarmTime;
  VisualState(this.userID, this.email, this.url, this.alarmTime, this.record);

  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.red[300],
      Colors.orange[400],
      Colors.yellow[600],
      Colors.limeAccent[700],
      Colors.blueAccent[100],
      Colors.indigo[300],
      Colors.deepPurpleAccent[100],
    ];
    double sleepAverage = record.sleep / record.countDay;
    double dumpAverage = record.dumpStatus / record.countDay;
    String dumpImage = "assets/${dumpAverage.round()}.png";

    int first=0,second=0,third=0,fourth=0,fifth=0,sixth=0,seventh = 0;

    for (int i = 0; i<record.morning.length; i++) {
      if (record.morning[i] == "1")
        first++;
      else if (record.morning[i] == "2")
        second++;
      else if (record.morning[i] == "3")
        third++;
      else if (record.morning[i] == "4")
        fourth++;
      else if (record.morning[i] == "5")
        fifth++;
      else if (record.morning[i] == "6")
        sixth++;
      else
        seventh++;
    }
    for (int i = 0; i<record.lunch.length; i++) {
      if (record.lunch[i] == "1")
        first++;
      else if (record.lunch[i] == "2")
        second++;
      else if (record.lunch[i] == "3")
        third++;
      else if (record.lunch[i] == "4")
        fourth++;
      else if (record.lunch[i] == "5")
        fifth++;
      else if (record.lunch[i] == "6")
        sixth++;
      else
        seventh++;
    }
    for (int i = 0; i<record.dinner.length; i++) {
      if (record.dinner[i] == "1")
        first++;
      else if (record.dinner[i] == "2")
        second++;
      else if (record.dinner[i] == "3")
        third++;
      else if (record.dinner[i] == "4")
        fourth++;
      else if (record.dinner[i] == "5")
        fifth++;
      else if (record.dinner[i] == "6")
        sixth++;
      else
        seventh++;
    }

    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("안 먹음", () => first.toDouble());
    dataMap.putIfAbsent("시리얼 또는 간식", () => second.toDouble());
    dataMap.putIfAbsent("인스턴트 또는 패스트푸드", () => third.toDouble());
    dataMap.putIfAbsent("채식위주 반찬", () => fourth.toDouble());
    dataMap.putIfAbsent("탄수화물 위주 반찬", () => fifth.toDouble());
    dataMap.putIfAbsent("지방 위주 반찬", () => sixth.toDouble());
    dataMap.putIfAbsent("단백질 위주 반찬", () => seventh.toDouble());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('${record.countDay}일의 장일기 분석'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: <Widget>[
            Column(
              children: <Widget>[
                // Attendance Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        child: Text("현재 출석일", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 80),
                        child: Row(
                          children: <Widget>[
                            if (record.countDay == 14)
                              Text('설문조사를 마치기까지 ${record.lastSubmitTime.toDate().difference(record.initialTme.toDate()).inDays+1}일 걸렸습니다', style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 130),
                        child: Row(
                          children: <Widget>[
                            if (record.countDay == 14)
                              Icon(Icons.notification_important, color: Colors.red,),
                            if (record.countDay == 14)
                              Text(' ${record.lastSubmitTime.toDate().difference(record.initialTme.toDate()).inDays-13}일 초과하였습니다', style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[CircularPercentIndicator(
                            radius: 250.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 10.0,
                            percent: record.countDay/14,
                            center: new Text(
                              "${record.countDay}일" + "(${(record.countDay/14 * 100).round()}%)",
                              style:
                              new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.indigo,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // Stress Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        child: Text("스트레스 지수 분석", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                      ),
                      SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          color: const Color(0xff2c4260),
                          child: BarChart(
                            BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 6,
                                barTouchData: BarTouchData(
                                  enabled: false,
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.transparent,
                                    tooltipPadding: const EdgeInsets.all(0),
                                    tooltipBottomMargin: 8,
                                    getTooltipItem: (
                                        BarChartGroupData group,
                                        int groupIndex,
                                        BarChartRodData rod,
                                        int rodIndex,
                                        ) {
                                      return BarTooltipItem(
                                        rod.y.round().toString(),
                                        TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    margin: 10,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0: return '1';
                                        case 1: return '2';
                                        case 2: return '3';
                                        case 3: return '4';
                                        case 4: return '5';
                                        case 5: return '6';
                                        case 6: return '7';
                                        case 7: return '8';
                                        case 8: return '9';
                                        case 9: return '10';
                                        case 10: return '11';
                                        case 11: return '12';
                                        case 12: return '13';
                                        case 13: return '14';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: const SideTitles(showTitles: false),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: [
                                  for (int i=0; i<record.countDay; i++)
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [BarChartRodData(y: int.parse(record.stressValue[i]).toDouble(), color: Colors.lightBlueAccent)],
                                      showingTooltipIndicators: [0]),
                                ]),
                        ),
                      ),),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("스트레스 지수가 낮은 상태로 유지되는 것이 좋습니다"),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // Drink Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        child: Text("음주량 분석", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: <Widget>[
                            if (record.drink <= 3)
                              for (int i = 0; i < record.drink; i++)
                                Icon(Icons.local_bar, color: Colors.blue),
                            if (record.drink <= 3)
                              for (int i = 0; i < 14-record.drink; i++)
                                Icon(Icons.local_bar, color: Colors.grey),
                            if (record.drink > 3)
                              for (int i = 0; i < 3; i++)
                                Icon(Icons.local_bar, color: Colors.blue),
                            if (record.drink > 3)
                              for (int i = 0; i < record.drink-3; i++)
                                Icon(Icons.local_bar, color: Colors.red),
                            if (record.drink > 3)
                              for (int i = 0; i < 14 - record.drink; i++)
                                Icon(Icons.local_bar, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        child:
                          Column(
                            children: <Widget>[
                              if(record.drink>3)
                                Text("   음주량 4회 이상!!\n과한 음주는 안 좋아요", style: TextStyle(color: Colors.red),)
                              else
                                Text("적정 음주량: 최대 3회\n  아직은 괜찮습니다."),
                            ],
                          ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // Sleep Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        child: Text("수면 시간 분석", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: sleepAverage/12,
                          center: Text("평균 " + sleepAverage.round().toString()+"시간"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: (sleepAverage.round()) >= 7 ? Colors.greenAccent : Colors.red,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                          if (sleepAverage.round() < 7)
                            Text("          수면 시간 부족\n적정 수면 시간: 평균 7시간", style: TextStyle(color: Colors.red))
                          else
                            Text("적절한 수면 시간입니다"),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // Meal Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("식단 분석", style: TextStyle(fontSize: 20, color: Colors.indigo)),
                      ),
                      SizedBox(height: 10),
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 2000),
                        chartLegendSpacing: 32.0,
                        chartRadius: MediaQuery.of(context).size.width / 2,
                        showChartValuesInPercentage: true,
                        showChartValues: true,
                        showChartValuesOutside: false,
                        chartValueBackgroundColor: Colors.grey[200],
                        colorList: colorList,
                        showLegends: true,
                        legendPosition: LegendPosition.right,
                        decimalPlaces: 1,
                        showChartValueLabel: true,
                        initialAngle: 0,
                        chartValueStyle: defaultChartValueStyle.copyWith(
                          color: Colors.blueGrey[900].withOpacity(0.9),
                        ),
                        chartType: ChartType.disc,
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("각 항목의 비율이 균등할 수록 좋습니다."),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // Bio Eat Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        child: Text("유산균 섭취 횟수", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: <Widget>[
                            for (int i = 0; i < record.bioEat; i++)
                              Icon(Icons.sentiment_very_satisfied, color: Colors.blue,),
                            for (int i = 0; i < record.countDay - record.bioEat; i++)
                              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red,),
                            for (int i = 0; i < 14 - record.countDay; i++)
                              Icon(Icons.sentiment_very_dissatisfied)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                          child: Text('유산균 섭취는 꾸준하게 하는 것이 중요합니다.')
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // # of dump Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("배변 횟수 분석", style: TextStyle(fontSize: 20, color: Colors.indigo)),
                      ),
                      SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          color: const Color(0xff2c4260),
                          child: BarChart(
                            BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 6,
                                barTouchData: BarTouchData(
                                  enabled: false,
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.transparent,
                                    tooltipPadding: const EdgeInsets.all(0),
                                    tooltipBottomMargin: 8,
                                    getTooltipItem: (
                                        BarChartGroupData group,
                                        int groupIndex,
                                        BarChartRodData rod,
                                        int rodIndex,
                                        ) {
                                      return BarTooltipItem(
                                        rod.y.round().toString(),
                                        TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    margin: 10,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0: return '1';
                                        case 1: return '2';
                                        case 2: return '3';
                                        case 3: return '4';
                                        case 4: return '5';
                                        case 5: return '6';
                                        case 6: return '7';
                                        case 7: return '8';
                                        case 8: return '9';
                                        case 9: return '10';
                                        case 10: return '11';
                                        case 11: return '12';
                                        case 12: return '13';
                                        case 13: return '14';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: const SideTitles(showTitles: false),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: [
                                  for (int i=0; i<record.countDay; i++)
                                    BarChartGroupData(
                                        x: 0,
                                        barRods: [BarChartRodData(y: int.parse(record.dumpCount[i]).toDouble(), color: Colors.lightBlueAccent)],
                                        showingTooltipIndicators: [0]),
                                ]),
                          ),
                        ),),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("배변 횟수가 낮은 상태로 유지되는 것이 좋습니다"),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                // Dump Feeling Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("배변감 분석", style: TextStyle(fontSize: 20, color: Colors.indigo)),
                      ),
                      SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          color: const Color(0xff2c4260),
                          child: BarChart(
                            BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 6,
                                barTouchData: BarTouchData(
                                  enabled: false,
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.transparent,
                                    tooltipPadding: const EdgeInsets.all(0),
                                    tooltipBottomMargin: 8,
                                    getTooltipItem: (
                                        BarChartGroupData group,
                                        int groupIndex,
                                        BarChartRodData rod,
                                        int rodIndex,
                                        ) {
                                      return BarTooltipItem(
                                        rod.y.round().toString(),
                                        TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    margin: 10,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0: return '1';
                                        case 1: return '2';
                                        case 2: return '3';
                                        case 3: return '4';
                                        case 4: return '5';
                                        case 5: return '6';
                                        case 6: return '7';
                                        case 7: return '8';
                                        case 8: return '9';
                                        case 9: return '10';
                                        case 10: return '11';
                                        case 11: return '12';
                                        case 12: return '13';
                                        case 13: return '14';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: const SideTitles(showTitles: false),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: [
                                  for (int i=0; i<record.countDay; i++)
                                    BarChartGroupData(
                                        x: 0,
                                        barRods: [BarChartRodData(y: int.parse(record.comfortValue[i]).toDouble(), color: Colors.lightBlueAccent)],
                                        showingTooltipIndicators: [0]),
                                ]),
                          ),
                        ),),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("수치가 높은 상태로 유지되는 것이 좋습니다"),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
                // Dump Status Card
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text("배변 상태 분석", style: TextStyle(fontSize: 20, color: Colors.indigo)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          dumpImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          '장 건강 상태 평균',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),),
                      Container(
                        alignment: Alignment.center,
                        child: Text("(Type 4에 근접할 수록 좋습니다)")
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
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
                        child: Text("Confirm", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userID: userID, email: email, url: url, alarmTime: alarmTime,)),);
                      }
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}