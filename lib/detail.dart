import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/record.dart';
import 'package:flutter_app/web.dart';

class DetailPage extends StatefulWidget {
  final Record record;
  final docID;
  final userID;
  DetailPage({Key key, @required this.record, @required this.userID, @required this.docID}) : super(key: key);

  DetailState createState() => DetailState(record, userID, docID);
}

class DetailState extends State<DetailPage> {
  final Record record;
  final docID;
  final userID;
  DetailState(this.record, this.userID, this.docID);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(record.name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.pop(context);},
          ),
        ),
        body: SnackBarPage(record: record, userID: userID, docID: docID),
      ),);
  }
}

class SnackBarPage extends StatefulWidget {
  final Record record;
  final userID;
  final docID;
  SnackBarPage({Key key, @required this.record, @required this.userID, @required this.docID}) : super(key: key);

  SnackBarState createState() => SnackBarState(record, userID, docID);
}

class SnackBarState extends State<SnackBarPage>{
  final Record record;
  final userID;
  final docID;
  final title = 'Detail';
  SnackBarState(this.record, this.userID, this.docID);

  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    String docID = widget.docID;
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection('Product_Info').document(docID).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildListItem(context, snapshot.data);
      },
    );
  }

  Widget _buildListItem(BuildContext context, snapshot) {
    final Record record = Record.fromSnapshot(snapshot);
    return ListView(
      children: [
        Container(
          child: Image.network(record.image, fit: BoxFit.contain, height: 300),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: <Widget>[
                      Container(
                        width: 250,
                        padding: const EdgeInsets.only(left:10, top:10, bottom:3),
                        child: Text(
                          record.name,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],),
                    Container(
                      padding: const EdgeInsets.only(left:10, top:3, bottom:3),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('${record.price}',
                              style: TextStyle(fontSize: 14),
                            ),),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left:10, top:3, bottom:3),
                      child: Text(record.description,
                          style: TextStyle(fontSize: 14)),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(left: 250),
                      child: FlatButton(
                        child: Container(
                          padding: EdgeInsets.only(
                              left:10, right:10, top:5, bottom: 5),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.indigo,
                                Colors.indigoAccent,
                                Colors.indigo,
                              ],
                            ),),
                          child: Text("구매하기",
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                WebPage())),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}