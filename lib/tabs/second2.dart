import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp(new MediaQuery(
    data: new MediaQueryData(), child: new MaterialApp(home: new SecondTab())));

final databaseReference = Firestore.instance;
class SecondTab extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image(image: AssetImage('images/saltbagel.jpg'),
             ),
              Text(
                "Add a Review",
                style: TextStyle(color: Colors.black),
              ),
                 RaisedButton(
            child: Text('View Reviews'),
            onPressed: () {
              getData();
            }, 
            ),
            ],
          ),
        ),
      ),
    );
  }
}
void getData() {
  databaseReference 
      .collection("Reviews")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
}
