import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final email, url;
  ProfilePage({Key key, @required this.email, @required this.url}) : super(key: key);
  ProfileState createState() => ProfileState(email, url);
}

class ProfileState extends State <ProfilePage> {
  final email, url;
  ProfileState(this.email, this.url);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('My Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.pop(context);},
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget> [
              SizedBox(height:10.0),
              Image.network(url, fit: BoxFit.contain, height: 240, width: 700),
              Container(padding: EdgeInsets.only(top: 20, left: 20, right: 20), child: Text(email, style: TextStyle(fontSize: 20)),),
            ],
          ),
        ),
      ),
    );
  }
}