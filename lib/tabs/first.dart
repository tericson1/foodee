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
        body: 
        Column(children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: 
                  Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child:
               Text("Top 3 Dishes Near Me",
              style: TextStyle(
                  color: Colors.lightGreenAccent[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
            ),
            Container(
              child:    Smallcard(
        foodimageurl: 'images/scallopplatter.png',
        rating: "96",
        dishname: "Fried Scallops",
        restaurant: "Petey's",
        location: "Rye, NH",
      ),
            ),
            Container(
              child:    Smallcard(
        foodimageurl: 'images/lobsterroll.jpg',
        rating: "95",
        dishname: "Lobster Roll",
        restaurant: "Beach Plum",
        location: "North Hampton, NH",
      ),
            ),
           
           
            Container(
              child:    Smallcard(
        foodimageurl: 'images/saltbagel.jpg',
        rating: "90",
        dishname: "Salt Bagel",
        restaurant: "Best Bagel",
        location: "Seabrook, NH",
      ),
            ),

           Container(
             padding: const EdgeInsets.all(10.0),
             child: Text("Top Reviews",
              style: TextStyle(
                  color: Colors.lightGreenAccent[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 22)
                  ),
           ),

Container(child: CustomCard(
    imageurl: 'https://rasamalaysia.com/wp-content/uploads/2012/07/lobster-rolls-thumb.jpg',
        rating: 95,
        dish: "Lobster Roll",
        review: "Very Scrumptious, best lobster roll I've ever had. Excellent butter proportions. Hot dog roll was toasted to perfection",
)),


            Container(
             padding: const EdgeInsets.all(10.0),
             child: Text("Browse by Category",
              style: TextStyle(
                  color: Colors.lightGreenAccent[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 22)
                  ),
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
                          return new  Card(
                           
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
           
            
          
          ]
          )
          )
          ),
        ]
        )

        );
  }
}
