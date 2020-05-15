import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';

//void main() => runApp(new MediaQuery(
//  data: new MediaQueryData(), child: new MaterialApp(home: new SecondTab())));

final databaseReference = Firestore.instance;
final _formKey = GlobalKey<FormState>();

//String restaurant;
//String dish;
String content;
int rating;
//dishimageURL;

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

            Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Add a Review",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue[900],
                                    fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Instructions: Rate the dish based off of the quality on a 0-100 scale. Leave service aspects off of the review, we only want to hear about the meal! Describe it in as much detail as you would like, how it made you feel, what you liked about it, what you didn't like about it. How it compares to other dishes of the same or similar type.",
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 14)),
                          ),
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
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.camera),
                              labelText: 'ImageURL',
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
                            child: Text('Add Review'),
                            onPressed: () {
                              createRecord();
                            },
                          ),
                        ])))
              ], //Widget
            ),
          ),
        ),
      ],
    ));
  }
}

void createRecord() async {
  DocumentReference ref = await databaseReference.collection("Reviews").add({
    'Content': 'test content',
    'Rating': 'test Rating',
    'ImageURL':
        'https://www.jocooks.com/wp-content/uploads/2016/02/chicken-and-seafood-paella-1-2-500x375.jpg'
    //need to figure out how to add image
    //how to add dish reference
  });
}
