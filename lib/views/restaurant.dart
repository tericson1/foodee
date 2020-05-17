import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:foodee/CustomCard.dart';
//final databaseReference = Firestore.instance;
import 'package:foodee/main.dart';

class Restauranthome extends StatelessWidget {
  Restauranthome({@required this.restaurant, this.location});
  final String restaurant;
  String location;

  void main() {
    runApp(MaterialApp(
        // Title
        title: "Using Tabs",
        //   navigatorKey: locator<NavigationService>().navigatorKey,
        // onGenerateRoute: router.generateRoute,
        // initialRoute: routes.LoginRoute,
        // Home
        home: MyHome()));
  }
//Profile Page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Title
        title: Text("Foodee"),
        // Set the background color of the App Bar
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(
        //         context: context,
        //         delegate: CustomSearchDelegate(),
        //       );
        //     },
        //   ),
        // ],

        backgroundColor: Colors.indigoAccent[700],
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: <Widget>[
          Container(
            width: 500,
            color: Colors.blue[600],
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      child: Text(restaurant,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Container(
                      child: Text(location,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Average Rating',
                              textAlign: TextAlign.center),
                        ),
                        Expanded(
                          child: Text('Number of Reviews',
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('Dishes')
                  .where('Restaurant', isEqualTo: restaurant)
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
                          subtitle: new Text(document['Category']),
                        );
                      }).toList(),
                    );
                }
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Material(
      //   // set the color of the bottom navigation bar
      //   color: Colors.indigoAccent[700],
      //   // set the tab bar as the child of bottom navigation bar
      //   child: TabBar(
      //     tabs: <Tab>[
      //       Tab(
      //         // set icon to the tab
      //         icon: Icon(Icons.home),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.add_comment),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.book),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.person),
      //       ),
      //     ],
      //     // setup the controller
      //     controller: controller,
      //   ),
      // )
      // TabBarView(
      //   // Add tabs as widgets
      //   children: <Widget>[FirstTab(), SecondTab(), ThirdTab(), FourthTab()],
      //   // set the controller
      //   controller: controller,
      // ),
      // // Set the bottom navigation bar
      // bottomNavigationBar: Material(
      //   // set the color of the bottom navigation bar
      //   color: Colors.indigoAccent[700],
      //   // set the tab bar as the child of bottom navigation bar
      //   child: TabBar(
      //     tabs: <Tab>[
      //       Tab(
      //         // set icon to the tab
      //         icon: Icon(Icons.home),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.add_comment),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.book),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.person),
      //       ),
      //     ],
      //     // setup the controller
      //     controller: controller,
      //   ),
      // )
    );
  }
}
