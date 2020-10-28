import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

//import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:intl/intl.dart';
//import 'package:flutter/services.dart';

//void main() => runApp(new MediaQuery(
//  data: new MediaQueryData(), child: new MaterialApp(home: new SecondTab())));

final databaseReference = Firestore.instance;
final _formKey = GlobalKey<FormState>();

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
//String dish
  String restaurant, content, dish, rating, foodpic;
  File _image;

  getRestaurant(restaurantname) {
    this.restaurant = restaurantname;
  }

  getDish(dishname) {
    this.dish = dishname;
  }

  getImageurl(imageurl) {
    this.foodpic = imageurl;
  }

  getReview(contentreview) {
    this.content = contentreview;
  }

  getRating(ratingnum) {
    this.rating = ratingnum;
  }

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Text('Add a Review');

    return Scaffold(
        body: Column(
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
                              onChanged: (String restaurantname) {
                                getRestaurant(restaurantname);
                              }),
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
                              onChanged: (String dishname) {
                                getDish(dishname);
                              }),

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
                              onChanged: (String ratingnum) {
                                getRating(ratingnum);
                              }),

                          TextFormField(
                              //maxLength: 500,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.fastfood),
                                  labelText: 'Review',
                                  hintText:
                                      'Enter your review of the meal here'),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (String contentreview) {
                                getReview(contentreview);
                              }),

                          TextFormField(
                              //maxLength: 500,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.fastfood),
                                  labelText: 'Image URL - TEMP',
                                  hintText: 'Image URl'),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (String imageurl) {
                                getImageurl(imageurl);
                              }),

                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     border: InputBorder.none,
                          //     icon: Icon(Icons.camera),
                          //     labelText: 'ImageURL',
                          //   ),
                          //   // The validator receives the text that the user has entered.
                          //   validator: (value) {
                          //     if (value.isEmpty) {
                          //       return 'Please enter some text';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          _image == null
                              ? Text('No image selected.')
                              : Image.file(_image),

                          FloatingActionButton(
                            onPressed: getImage,
                            tooltip: 'Pick Image',
                            child: Icon(Icons.add_a_photo),
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

  void createRecord() async {
    DocumentReference ref = await databaseReference.collection("Reviews").add({
      'Restaurant': restaurant,
      'Dish': dish,
      'Content': content,
      'Rating': rating,
      'ImageURL': foodpic,
      //need to figure out how to add image
      //how to add dish reference
    });
  }
}

// void createRecord() async {
//   DocumentReference ref = await databaseReference.collection("Reviews").add({
//     'Content': 'test content',
//     'Rating': 'test Rating',
//     'ImageURL':
//         'https://www.jocooks.com/wp-content/uploads/2016/02/chicken-and-seafood-paella-1-2-500x375.jpg'
//     //need to figure out how to add image
//     //how to add dish reference
//   });
// }}
