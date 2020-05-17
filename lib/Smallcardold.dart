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

// List<Smallcard> dishes (BuildContext context) => [
//       Smallcard(
//         foodimageurl: 'images/saltbagel.jpg',
//         rating: "60",
//         dishname: "dishname",
//         restaurant: "restaurant",
//         location: "test location",
//       ),
// ];

//change class name
//class AdvertisementItemWidget extends StatelessWidget {
  //  const AdvertisementItemWidget({Key key, @required this.dish})
  //: assert(dish != null),
  // super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.

  //final Smallcard dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 130, width: 500),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 0,
            top: 10,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
              ),
              //child: Container(child: Text("Box")),
            ),
          ),
          Positioned(
            left: 0,
            top: 10,
            right: 0,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,

                  //Child 1 = Image

                  child: Container(
                    width: 175,
                    height: 130,
                    child: Image.asset(
                      foodimageurl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 130,
                      width: 175,
                      margin: EdgeInsets.only(left: 0, top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              //height: 30,
                              child: FlatButton(
                                  child: Text(
                                    dish,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dishhome(
                                                  restaurant: restaurant,
                                                  dish: dish,
                                                )));
                                  }),
                            ),
                          ),
                          //child 2 = descripion
                          Container(
                            // margin: EdgeInsets.only(top: 5),
                            child: Text(
                              rating,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            child: FlatButton(
                                child: Text(restaurant + ' - ' + location,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey[900], fontSize: 16)),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
