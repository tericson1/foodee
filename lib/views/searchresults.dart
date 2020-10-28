import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodee/CustomCard.dart';
import 'package:foodee/views/restaurant.dart';
import 'package:foodee/DishSumNoPic.dart';

class Searchresults extends StatelessWidget {
  Searchresults({@required this.dish, this.restaurant, this.location});

  String dish;
  // final imageurl;
  String restaurant;
  String location;

  @override
  Widget build(BuildContext context) {
    CollectionReference _collection = Firestore.instance.collection('Reviews');

    return Scaffold(
        appBar: AppBar(
          title: Text("Foodee"),
          backgroundColor: Colors.indigoAccent[700],
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      child: DishSumNoPic(
                        dish: 'Lobster Roll',
                        restaurant: "Ray's Seafood",
                        location: 'Rye, NH',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: CustomCard(
                        imageurl:
                            'https://s3-media0.fl.yelpcdn.com/bphoto/SlBmi1z5-CKaFNHAhq28Dw/l.jpg',
                        rating: 88,
                        dish: "Lobster Roll",
                        restaurant: 'cool',
                        review:
                            "Was on a bulky roll which I didn't like as much as a hot dog roll. The lobster was fresh, the mayo not too much. Good amount of lobster, I was satisfied with this roll",
                      )),
                    ),
                    Container(
                      child: DishSumNoPic(
                        dish: 'Lobster Roll',
                        restaurant: "The Beach Plum",
                        location: 'North Hampton, NH',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: CustomCard(
                        imageurl:
                            'https://rasamalaysia.com/wp-content/uploads/2012/07/lobster-rolls-thumb.jpg',
                        rating: 95,
                        dish: "Lobster Roll",
                        restaurant: 'Beach Plum',
                        review:
                            "Very Scrumptious, best lobster roll I've ever had. Excellent butter proportions. Hot dog roll was toasted to perfection",
                      )),
                    ),
                  ])
                ]),
              ),
            ),
          ],
        ));
  }
}
