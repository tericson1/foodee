import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

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
  File _galimage;
  String imageUrl;

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

  _getFromGallery() async {
    PickedFile galpickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (galpickedFile != null) {
      setState(() {
        _galimage = File(galpickedFile.path);
      });
    }
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child('reviewpics/test2')
            .putFile(file)
            .onComplete;
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
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

                          RaisedButton(
                            color: Colors.greenAccent,
                            onPressed: () {
                              uploadImage();

                              // _getFromGallery();
                            },
                            child: Text("PICK FROM GALLERY"),
                          ),
                          // TextFormField(
                          //     //maxLength: 500,
                          //     maxLines: 10,
                          //     decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         icon: Icon(Icons.fastfood),
                          //         labelText: 'Image URL - TEMP',
                          //         hintText: 'Image URl'),
                          //     // The validator receives the text that the user has entered.
                          //     validator: (value) {
                          //       if (value.isEmpty) {
                          //         return 'Please enter some text';
                          //       }
                          //       return null;
                          //     },
                          //     onChanged: (String imageurl) {
                          //       getImageurl(imageurl);
                          //     }),
                          _image == null
                              ? Text('No image selected.')
                              : Image.file(_image),
                          FloatingActionButton(
                            onPressed: getImage,
                            tooltip: 'Pick Image',
                            child: Icon(Icons.add_a_photo),
                          ),

                          // _galimage == null
                          //     ? Text('No image selected.')
                          //     : Image.file(_galimage),
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

//   Future uploadFile() async {
//    StorageReference storageReference = FirebaseStorage.instance
//        .ref()
//        .child('chats/${Path.basename(_image.path)}}');
//    StorageUploadTask uploadTask = storageReference.putFile(_image);
//    await uploadTask.onComplete;
//    print('File Uploaded');
//    storageReference.getDownloadURL().then((fileURL) {
//      setState(() {
//        _uploadedFileURL = fileURL;
//      });
//    });
//  }

  void createRecord() async {
    DocumentReference ref = await databaseReference.collection("Reviews").add({
      'Restaurant': restaurant,
      'Dish': dish,
      'Content': content,
      'Rating': rating,
      'ImageURL': imageUrl,
      //need to figure out how to add image
      //how to add dish reference
    });
  }
}
