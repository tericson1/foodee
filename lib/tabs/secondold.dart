import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//void main() => runApp(new MediaQuery(
//  data: new MediaQueryData(), child: new MaterialApp(home: new SecondTab())));

//final databaseReference = Firestore.instance;

//Firestore.instance.collection('Dishes').document().setData({ 'name': 'Name', 'category': 'Category', 'restaurant':'Restaurant' });

class SecondTab extends StatelessWidget {
  // SecondTab({@required this.name, this.category, this.neighborhood});
  // final name;
  // final category;
  // final neighborhood;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[50],
        body: Column(children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Container(
              child: Text("Dishes"),
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('Dishes').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new Column(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new ListTile(
                            title: new Text(document['Name']),
                            subtitle: new Text(document['Category']),
                            //new Text(document['Restaurant'].toString());
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
            Container(
              child: Text("Restaurants"),
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    Firestore.instance.collection('Restaurants').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new Column(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new ListTile(
                            title: new Text(document['Name']),
                            subtitle: new Text(document['Neighborhood']),
                            //new Text(document['Restaurant'].toString());
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
          ]))),
        ]));
  }
}
