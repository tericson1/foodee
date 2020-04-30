import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'tabs/fourth.dart';
//import 'package:foodee/views/restaurant.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {@required this.review, this.rating, this.dish, this.imageurl});

  final String review;
  final  rating;
  final String dish;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: 
        Container(
            padding: const EdgeInsets.all(5.0),
            // margin: EdgeInsets.all(30.0),
            child: Column(
               
              children: 
              <Widget>[
               //child: Container(
                 // padding: const EdgeInsets.all(5.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                  rating.toString(),
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22)
                  ),
                ),
               // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(imageurl)
                  ,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(review,
                   style: TextStyle(
                    fontSize: 16)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Dish: '+ dish.toString()
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Text('Dish: '),
                //   //+ restaurant.toString()),
                // ),

                
                FlatButton(
                    child: Text("See More"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FourthTab(
                                  rating: rating,
                                  review: review,
                                  dish: dish,
                                  imageurl: imageurl)));
                    }),
              ],
            )));
  }
}
