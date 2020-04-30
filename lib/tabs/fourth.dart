import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodee/CustomCard.dart';
import 'package:foodee/views/restaurant.dart';
//final databaseReference = Firestore.instance;

class FourthTab extends StatelessWidget {
  FourthTab(
      {@required this.review, this.rating, this.dish, this.imageurl,this.restaurant,this.location});
  final rating;
  final review;
  final dish;
  final imageurl;
   String restaurant;
   String location;


//Profile Page 

  @override
  Widget build(BuildContext context) {
    restaurant = 'BK Lounge';
    location = 'Hampton,NH';
    CollectionReference _collection = Firestore.instance.collection('Reviews');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: 
Column(
 
  children: <Widget>[
   Container
   (
      width: 500,
      color: Colors.blue[600],
      child:
   Card(
 child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        
        Text('Dish Name',
        style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 22)
        ),

                FlatButton(
                    child: Text('restaurant , location', style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Restauranthome(
                                  restaurant: restaurant,
                                  )));
                    }),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              
  children: <Widget>[
    Expanded(
      child: Text('Average Rating', textAlign: TextAlign.center),
    ),
    Expanded(
      child: Text('Number of Reviews', textAlign: TextAlign.center),
    ),
    
    
  ],
),
          ),
         
        ],
      ),
   ),
   ),
      Expanded( child:Container(

          child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: _collection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new CustomCard(
                        rating: document['Rating'],
                        review: document['Content'],
                        // dish: ${_collection.where('ref', isEqualTo: 'Dish')
                        //         .getDocuments()
                        //         .when((doc) {ref_value = doc.documents[0]['ref'];})},
                        imageurl: document['ImageURL'],
                      );
                    }).toList(),
                  );
              }
            },
          ),



        ),
      )
      ),
    ),
  ]
)
    );
  }
}

/*
await Firestore.instance
    .collection('Reviews')
    .where('ref', isEqualTo: 'Dish')
    .getDocuments()
    .then((doc) {
  ref_value = doc.documents[0]['ref'];
});
get another with that reference

await Firestore.instance
    .collection('collection')
    .where('ref', isEqualTo: ref_value)
    .limit(1)
    .getDocuments()
    .then((doc) {
  ref_value = doc.documents[0]['ref'];
});
*/