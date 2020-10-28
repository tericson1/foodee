import 'package:flutter/material.dart';
import 'package:foodee/views/dishhome.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {@required this.review,
      this.rating,
      this.dish,
      this.imageurl,
      this.restaurant});

  final String review;
  final rating;
  final String dish;
  final String imageurl;
  final String restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      //color: Colors.grey[200],

                      ),
                  child: Column(
                    children: [
                      Text(dish,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //color: Colors.white,
                              fontSize: 18)),
                      Text(restaurant,
                          style: TextStyle(

                              //color: Colors.white,
                              fontSize: 16)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.network(
                    imageurl,
                    height: 275,
                    width: 475,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(review, style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey[700], shape: BoxShape.circle),
                    child: Center(
                      child: Text(rating.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18)),
                    ),
                  ),
                ),
                Text('Reviewed By: Joshua M.'),
                Text('Review Date: 5/15/2020'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.thumb_down, size: 40.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.thumb_up, size: 40.0),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
