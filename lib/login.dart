import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/alarmSetting.dart';
import 'package:flutter_app/daily.record.dart';
import 'package:flutter_app/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class SignInPage extends StatefulWidget {
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
            SizedBox(height: 180.0),
            Column(
              children: <Widget>[
                Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/final-exam-de688.appspot.com/o/hslogo.png?alt=media&token=95757f58-f5eb-4f42-b285-3bdebe5c16c7',
                    height: 100),
                SizedBox(height: 15),
                Text("HandongSAM",
                    style: TextStyle(fontSize: 30))
              ],
            ),
            SizedBox(height: 75.0),
            _GoogleSignInSection()
          ],
        );
      }),
    );
  }
}

class _GoogleSignInSection extends StatefulWidget {
  @override
  _GoogleSignInSectionState createState() => _GoogleSignInSectionState();
}

class _GoogleSignInSectionState extends State<_GoogleSignInSection> {
  String url;
  String userID;
  String email;
  DailyRecord dailyRecord;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 360,
          child: FlatButton(
            onPressed: () async {
              final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
              final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
              final AuthCredential credential = GoogleAuthProvider.getCredential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              );
              final FirebaseUser user =
              (await _auth.signInWithCredential(credential));
              assert(user.email != null);
              assert(user.displayName != null);
              assert(!user.isAnonymous);
              assert(await user.getIdToken() != null);

              final FirebaseUser currentUser = await _auth.currentUser();
              assert(user.uid == currentUser.uid);
              setState(() {
                if (user != null) {
                  userID = user.uid;
                  email = user.email;
                  url = user.photoUrl;
                }
              });
              final snapshot = await Firestore.instance.collection("Daily_Record").document(userID).get();
              if (snapshot == null || !snapshot.exists) {
                Firestore.instance
                    .collection("Daily_Record")
                    .document(userID).setData({
                  "stressValue": "", "drink": 0, "sleep": 0,
                  "morning": "", "lunch": "", "dinner": "",
                  "bioEat": 0, "dumpStatus": 0,
                  "countDay": 0, "comfortValue": "",
                  "dumpCount": "", "alarmTime": "",
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        AlarmPage(userID: userID, email: email, url: url)));
              }
              else {
                DailyRecord dailyRecord = DailyRecord.fromSnapshot(snapshot);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        HomePage(
                          userID: userID,
                          email: email,
                          url: url,
                          alarmTime: dailyRecord.alarmTime.toDate(),)));
              }
            },
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/final-exam-de688.appspot.com/o/googleSignIn.png?alt=media&token=b0039108-6b44-4cce-8091-b9d1264b071a',
                fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}