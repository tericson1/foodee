import 'package:flutter/material.dart';
import 'package:foodee/values/values.dart';
import 'package:foodee/views/dishhome.dart';
import 'package:foodee/views/restaurant.dart';

class Smallcard extends StatelessWidget {
  const Smallcard({
    @required this.foodimageurl,
    @required this.rating,
    @required this.dish,
    @required this.restaurant,
    @required this.location,
  })  : assert(foodimageurl != null),
        assert(rating != null),
        assert(dish != null),
        assert(restaurant != null),
        assert(location != null);

  final String foodimageurl;
  final String rating;
  final String dish;
  final String restaurant;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 500,
      child: Card(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(foodimageurl,
                        height: 110.0, width: 125.0, fit: BoxFit.fill),
                  ),
                ],
              ),
            ),
            Container(
              width: 215,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text(dish,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan[800],
                              fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dishhome(
                                      restaurant: restaurant,
                                      location: location,
                                      dish: dish,
                                    )));
                      }),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[200], shape: BoxShape.circle),
                    child: Center(
                      child: Text(rating,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18)),
                    ),
                  ),
                  Text(restaurant,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 16)),
                  Text(location,
                      style: TextStyle(color: Colors.grey[800], fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
