
import 'package:flutter/material.dart';
import 'package:foodee/values/values.dart';



class Smallcard extends StatelessWidget {
  const Smallcard({@required this.foodimageurl,@required this.rating,@required this.dishname,@required this.restaurant,@required this.location,
  })  : assert(foodimageurl != null),
        assert(rating != null),
        assert(dishname != null),
        assert(restaurant != null),
        assert(location != null);

  final String foodimageurl;
  final String rating;
  final String dishname;
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
            right: 42,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,

                  //Child 1 = Image

                  child: Container(
                    width: 175,
                    height: 115,
                    child:
                        Image.asset(foodimageurl,

                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //child 2 = title
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 115,
                      margin: EdgeInsets.only(left: 15, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              dishname,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                height: 1.42857,
                              ),
                            ),
                          ),
                          //child 2 = descripion
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              rating,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              restaurant,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  location,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
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
