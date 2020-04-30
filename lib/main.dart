

import 'package:flutter/material.dart';
//import 'package:foodee/views/restaurant.dart';
import 'tabs/first.dart';
import 'tabs/second.dart';
import 'tabs/third.dart';
import 'tabs/fourth.dart';
import 'CustomSearchDelegate.dart';

//import 'tabs/cards.dart';
//import 'package:firebase_database/firebase_database.dart';

// import 'views/login.dart';
// import 'package:foodee/router.dart' as router;
// import 'package:foodee/consts/routes_path.dart' as routes;
// import 'locator.dart';
// import 'services/navigation_service.dart';

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

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Foodee"),
        // Set the background color of the App Bar
 actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
      },
    ),
  ],
        
        backgroundColor: Colors.indigoAccent[700],
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[FirstTab(), SecondTab(), ThirdTab(),FourthTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.indigoAccent[700],
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.add_comment),
            ),
            Tab(
              icon: Icon(Icons.book),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}


