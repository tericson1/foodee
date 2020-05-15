import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text("Scrap",
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 26)),
                  Container
                      // padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      (
                    child: Column(children: [
                      for (final destination in destinations(context))
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: (destination.type == CardDemoType.standard)
                              ? TravelDestinationItem(destination: destination)
                              : destination.type == CardDemoType.tappable
                                  ? TappableTravelDestinationItem(
                                      destination: destination)
                                  : SelectableTravelDestinationItem(
                                      destination: destination),
                        ),
                    ]),
                  ),
                  Container(
                    child: Text("All Dishes"),
                  ),
                  Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream:
                          Firestore.instance.collection('Dishes').snapshots(),
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
                                );
                              }).toList(),
                            );
                        }
                      },
                    ),
                  ),
                  Container(
                    child: Text("All Restaurants"),
                  ),
                  Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('Restaurants')
                          .snapshots(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//     Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//          Text(
//             "Rules",
//               style: TextStyle(color: Colors.lightGreenAccent[700], fontWeight: FontWeight.bold,
//     fontSize: 30),
//             ),
//             Text(
//               "Foodie is a community of people who:	Love food	Want to share meals from restaurants that have inspired them	Want to find their next mealReview Standards: 	Foodie is about the food, and the food only. If you had a bad experience with the wait staff somewhere, bring  your complaints to yelp. 	Bring your best to Foodie. Foodie is a collection of diabolical meals, not a collection of mediocre and poor meals. The only exception is if something you had did not meet expectations in a very specific way that you want to warn your fellow foodies about. We want Foodie as a collection of all the amazing and inspiring meals out there so other Foodies can uncover them. 	Reviews must be genuine. They are reviewedfor quality purposes. Promotional reviews will beremoved, as will overly negative, personal,or derogatory reviews. ",
//               style: TextStyle(color: Colors.black),
//             ),
// IconButton(
//           icon: Icon(Icons.flash_on),
//           tooltip: 'Search',
//           onPressed: null,
//         ),
//             Text(
//               "Rating Scale:	1 Flame: Great meal, would recommend 	2 Flames: Best meal of its category that you've 			          had	3 Flames: Diabolical, life changing	X - Did not meet expectations.",
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     ),
