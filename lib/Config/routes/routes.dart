import 'package:ecommerce/Features/card/card_screnn.dart';
import 'package:ecommerce/Features/home/presentation/pages/Product_Details.dart';
import 'package:ecommerce/Features/home/presentation/pages/main_page.dart';
import 'package:ecommerce/Features/login/presentation/pages/Login_Screen.dart';
import 'package:ecommerce/Features/signup/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../Features/home/presentation/pages/home_screen.dart';

class RoutesName {
  static const String login = "/";
  static const String signup = "signup";
  static const String home = "home";
  static const String cardScreen = "CardScreen";
  static const String productDetails = "produuctDetails";
}

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => Signup(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) =>  HomeScreen(),
        );
      case RoutesName.cardScreen:
        return MaterialPageRoute(
          builder: (context) => CardScreen(),
        );
      // case RoutesName.productDetails:
      //   return MaterialPageRoute(builder: (context) => ProductDetails(),);
      default :
        return MaterialPageRoute(builder: (context) => undifinedRoute(),);
    }
  }
  static Widget undifinedRoute(){

    return  Scaffold();

}
}
