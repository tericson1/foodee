import 'package:flutter/material.dart';
import 'package:foodee/views/restaurant.dart';
//final databaseReference = Firestore.instance;

class DishSumNoPic extends StatelessWidget {
  DishSumNoPic({this.dish, this.restaurant, this.location});

  String dish;
  String restaurant;
  String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Container(
          width: 500,
          color: Colors.blue[600],
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(dish,
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Average Rating',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          color: Colors.indigo[100],
                          height: 45,
                          width: 50,
                          child: Center(
                              child: Text('91',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))),
                        ),
                      ]),
                      // Column(
                      //   children: <Widget>[
                      //     Text('Add Review'),
                      //     Icon(Icons.add_circle_outline),
                      //   ],
                      // ),
                      Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Number of Reviews',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          color: Colors.indigo[100],
                          height: 45,
                          width: 50,
                          child: Center(
                              child: Text('5',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))),
                        ),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  height: 40,
                  color: Colors.blue[900],
                  child: FlatButton(
                      child: Text(restaurant + " - " + location,
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Restauranthome(
                                      restaurant: restaurant,
                                      location: location,
                                    )));
                      }),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
