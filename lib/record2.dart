import 'package:cloud_firestore/cloud_firestore.dart';

class DailyRecord {
  final String stressValue;
  final int sleep, drink;
  final int dumpStatus;
  final String morning, lunch, dinner;
  final int bioEat;
  final String comfortValue;
  final String dumpCount;
  final int countDay;
  final Timestamp alarmTime;
  final Timestamp submitTime;
  final DocumentReference reference;

  DailyRecord.fromMap(Map<String, dynamic> map, {this.reference}):
        submitTime = map['submitTime'],
        stressValue = map['stressValue'],
        drink = map['drink'],
        sleep = map['sleep'],
        morning = map['morning'],
        lunch = map['lunch'],
        dinner = map['dinner'],
        bioEat = map['bioEat'],
        comfortValue = map['comfortValue'],
        dumpStatus = map['dumpStatus'],
        dumpCount = map['dumpCount'],
        countDay = map['countDay'],
        alarmTime =  map['alarmTime'];

  DailyRecord.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$stressValue>";
}