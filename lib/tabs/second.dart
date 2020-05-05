import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';

//void main() => runApp(new MediaQuery(
//  data: new MediaQueryData(), child: new MaterialApp(home: new SecondTab())));

final databaseReference = Firestore.instance;
 final _formKey = GlobalKey<FormState>();

//Firestore.instance.collection('Dishes').snapshots(),
//Firestore.instance.collection('Dishes').document().setData({ 'name': 'Name', 'category': 'Category', 'restaurant':'Restaurant' });

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text('Add a Review');
    return Scaffold(
      body:
    //resizeToAvoidBottomPadding: false,
    //backgroundColor: Colors.grey[50],
    // body: //Text('Add A Review'),
   


    // Build a Form widget using the _formKey created above.
     Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Text("Add a Review",
              style: TextStyle(
                  color: Colors.lightGreenAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.restaurant),
              labelText: 'Restaurant',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.restaurant_menu),
              labelText: 'Dish',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          RaisedButton(
    child: Text('Create Record'),
    onPressed: () {
      createRecord();
    },
),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.stars),
              labelText: 'Rating',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            //maxLength: 500,
            maxLines: 10,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.fastfood),
                labelText: 'Review',
                hintText: 'Enter your review of the meal here'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

        ]
        )
        )
    );
  }
}

void createRecord() async {
  DocumentReference ref = await databaseReference.collection("Reviews")
      .add({
        'Content': 'test content',
        'Rating': 'test Rating',
        'ImageURL': 'https://www.jocooks.com/wp-content/uploads/2016/02/chicken-and-seafood-paella-1-2-500x375.jpg'
      });
}
