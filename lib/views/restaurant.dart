import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:foodee/CustomCard.dart';
//final databaseReference = Firestore.instance;
import 'package:foodee/main.dart';

class Restauranthome extends StatelessWidget {
  Restauranthome(
      {@required this.restaurant});
  final String restaurant;


void main() {
  runApp(MaterialApp(
      // Title
      title: "Using Tabs",
      //   navigatorKey: locator<NavigationService>().navigatorKey,
      // onGenerateRoute: router.generateRoute,
      // initialRoute: routes.LoginRoute,
      // Home
      home: MyHome()
      )
      );
}
//Profile Page 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
        
     

                Container(
                    child: Text(restaurant, style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 16)
                  )
                ),                         
                   Container(
                    child: Text("location", style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 16)
                  )
                ),     
                    

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
        ],
   ),
   );
  }
}

