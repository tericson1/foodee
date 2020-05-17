import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:foodee/Smallcard.dart';
import 'package:foodee/CustomCard.dart';

void main() => runApp(new MediaQuery(
    data: new MediaQueryData(), child: new MaterialApp(home: new FirstTab())));

class FirstTab extends StatelessWidget {
  // const TravelDestinationItem({Key key, @required this.destination})
  final databaseReference = Firestore.instance;
  // final TravelDestination destination;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomPadding: false,
        body: Column(children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text("Discover: Top 3 Dishes Near Me",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[800],
                      fontSize: 20)),
            ),
            Container(
              child: Smallcard(
                foodimageurl: 'images/kimchi.jpg',
                rating: "96",
                dish: "Kimchi Ramen",
                restaurant: "Sapporo",
                location: "Cambridge, Ma",
              ),
            ),
            Container(
              child: Smallcard(
                foodimageurl: 'images/lobstercacio.jpg',
                rating: "95",
                dish: "Lobster Cacio E Pepe",
                restaurant: "Waypoint",
                location: "Cambridge, Ma",
              ),
            ),
            Container(
              child: Smallcard(
                foodimageurl: 'images/lobsterhourly.jpg',
                rating: "90",
                dish: "Lobster Roll",
                restaurant: "Hourly Oyster House",
                location: "Cambridge, Ma",
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: Text("Top Reviews",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue[800],
                        fontSize: 20))),
            Container(
                child: CustomCard(
              imageurl:
                  'https://i.pinimg.com/564x/a6/a4/fb/a6a4fbb5bc30ebd05d43fb0ad040c039.jpg',
              rating: 95,
              dish: "Lobster Roll",
              review:
                  "Very Scrumptious, best lobster roll I've ever had. Excellent butter proportions. Hot dog roll was toasted to perfection",
            )),
            Container(
                child: CustomCard(
              imageurl:
                  'https://www.jerseygirlcooks.com/wp-content/uploads/2017/09/DSC_0793-1024x683.jpg',
              rating: 95,
              dish: "Pan Seared Swordfish",
              review:
                  "Cooked to Perfection. Flavor was immaculate.Made me feel like I was a King. Portions were good, not too much not too little",
            )),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Text("Browse by Category",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[800],
                      fontSize: 20)),
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
                          return new Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(document['Category']),
                                Icon(Icons.restaurant),
                              ],
                            ),
                          );
                          //
                          // subtitle: new Text(document['Restaurant'].collection('Dishes').document['Name']),
                          //new Text(document['Restaurant'].toString());
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
