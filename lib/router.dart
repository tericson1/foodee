  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/consts/routes_path.dart' as routes;
import 'package:foodee/tabs/first.dart';
//import 'package:foodee/views/restaurant.dart';
import 'package:foodee/views/login.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    // case routes.MenuRoute:
    //   return MaterialPageRoute(builder: (context) => MenuView());
    // case routes.DetailsRoute:
    //   var foodId = settings.arguments as String;
    //   return MaterialPageRoute(builder: (context) => DetailsView(id: foodId));
    default:
      return MaterialPageRoute(
          builder: (context) => FirstTab());
  }
}