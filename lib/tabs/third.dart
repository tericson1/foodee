import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodee/CustomCard.dart';
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
                    review:
                        "Cooked to Perfection. Flavor was immaculate.Made me feel like I was a King. Portions were good, not too much not too little",
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: CustomCard(
                    imageurl:
                        'https://assets.epicurious.com/photos/5764583142e4a5ed66d1df6c/6:4/w_620%2Ch_413/seafood-paella.jpg',
                    rating: 91,
                    dish: "Seafood Paella",
                    review:
                        "Was a little lukewarm when it arrive, but very delicious! Portions were good and flavor was amazing. Salty but robust spice, very enjoyable!",
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Center(
                      child: Text(
                          "Recent Dishes Reviewed at Neighborhood Restaurants",
                          style: TextStyle(
                              color: Colors.lightBlue[900], fontSize: 18)),
                    ),
                  ),
                ),
                Container(
                  child: Smallcard(
                    foodimageurl: 'images/padthai.jpg',
                    rating: "84",
                    dish: "Pad Thai",
                    restaurant: "Thai House",
                    location: "Hampton, Nh",
                  ),
                ),
                Container(
                  child: Smallcard(
                    foodimageurl: 'images/tacos.jpg',
                    rating: "96",
                    dish: "Chicken Taco's",
                    restaurant: "Burrito Loco",
                    location: "Hampton, NH",
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
