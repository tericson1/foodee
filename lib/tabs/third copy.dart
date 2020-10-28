import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodee/CustomCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodee/Smallcard.dart';
//import 'package:foodee/views/searchresults.dart';
//import 'cards.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Activity: Recent Reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[900],
                            fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: CustomCard(
                    imageurl:
                        'https://www.jerseygirlcooks.com/wp-content/uploads/2017/09/DSC_0793-1024x683.jpg',
                    rating: 95,
                    dish: "Pan Seared Swordfish",
                    restaurant: 'Jumpin Jays',
                    review:
                        "Cooked to Perfection. Flavor was immaculate.Made me feel like I was a King. Portions were good, not too much not too little",
                  )),
                ),

                // Container(
                //   child: Smallcard(
                //     foodimageurl: 'images/padthai.jpg',
                //     rating: "84",
                //     dish: "Pad Thai",
                //     restaurant: "Thai House",
                //     location: "Hampton, Nh",
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     child: Smallcard(
                //       foodimageurl: 'images/tacos.jpg',
                //       rating: "96",
                //       dish: "Chicken Taco's",
                //       restaurant: "Burrito Loco",
                //       location: "Hampton, NH",
                //     ),
                //   ),
                // ),

                Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream:
                        Firestore.instance.collection('Reviews').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text('No data'),
                        );
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
                        default:
                          return new Column(
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return new CustomCard(
                                  imageurl: (document['ImageURL']),
                                  rating: (document['Rating']),
                                  dish: (document['Dish']),
                                  restaurant: (document['Restaurant']),
                                  review: (document['Content']));
                            }).toList(),
                          );
                          return new Column(
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return new Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(document['Restaurant']),
                                    Icon(Icons.restaurant),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                      }
                    },
                  ),
                ),
                // TextFormField(
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'Search for Dish, Location or Restaurant';
                //     }
                //     return null;
                //   },
                // ),

                // Text('Submit'),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
