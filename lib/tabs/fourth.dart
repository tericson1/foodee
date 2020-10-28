import 'package:flutter/material.dart';
import 'package:foodee/Smallcard.dart';

class FourthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Container(child:

                  Center(
                    child: Text("My Profile",
                        style: TextStyle(
                            color: Colors.lightBlue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 250.0,
                        height: 250.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage('images/JoshProf.jpg')))),
                  ),
                  Icon(Icons.add_a_photo),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("E-mail:",
                              style: TextStyle(
                                  color: Colors.lightGreenAccent[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        Text("JPM12788@Gmail.com",
                            style: TextStyle(
                                color: Colors.lightGreenAccent[900],
                                fontSize: 20)),
                        Icon(Icons.edit),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Password: *****",
                            style: TextStyle(
                                color: Colors.lightGreenAccent[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Bio:",
                            style: TextStyle(
                                color: Colors.lightGreenAccent[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Dietary Preferences",
                        style: TextStyle(
                            color: Colors.lightGreenAccent[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                  Text("Carnivore",
                      style: TextStyle(
                          color: Colors.lightGreenAccent[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Icon(Icons.add),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" My Neighborhoods",
                        style: TextStyle(
                            color: Colors.lightGreenAccent[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                  Text("Malden",
                      style: TextStyle(
                          color: Colors.lightGreenAccent[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text("Rockland, ME",
                      style: TextStyle(
                          color: Colors.lightGreenAccent[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text("Hampton Beach",
                      style: TextStyle(
                          color: Colors.lightGreenAccent[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Icon(Icons.add),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("I am a Connoisseur of:",
                        style: TextStyle(
                            color: Colors.lightGreenAccent[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                  Text("Buffalo Chicken",
                      style: TextStyle(
                          color: Colors.lightGreenAccent[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text("Carbonara",
                      style: TextStyle(
                          color: Colors.lightGreenAccent[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Icon(Icons.add),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" My Reviews",
                        style: TextStyle(
                            color: Colors.lightGreenAccent[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      child: Smallcard(
                        foodimageurl: 'images/scallopplatter.png',
                        rating: "96",
                        dish: "Fried Scallops",
                        restaurant: "Petey's",
                        location: "Rye, NH",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      child: Smallcard(
                        foodimageurl: 'images/saltbagel.jpg',
                        rating: "84",
                        dish: "Salt Bagel",
                        restaurant: "Best Bagel",
                        location: "Seabrook, NH",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(" My Wishlist",
                        style: TextStyle(
                            color: Colors.lightGreenAccent[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      child: Smallcard(
                        foodimageurl: 'images/lobsterroll.jpg',
                        rating: "95",
                        dish: "Lobster Roll",
                        restaurant: "Beach Plum",
                        location: "North Hampton, NH",
                      ),
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
