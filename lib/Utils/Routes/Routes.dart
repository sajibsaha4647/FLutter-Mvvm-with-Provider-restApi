import 'package:flutter/cupertino.dart';
import 'package:fluttermvvm/View/HomeScreen.dart';
import 'package:fluttermvvm/View/Splashscreen.dart';

import '../../View/LoginScreen.dart';
import 'RoutesName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home :
        return CupertinoPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.login :
        return CupertinoPageRoute(builder: (BuildContext context)=>LoginScreen());
      case RoutesName.splash :
        return CupertinoPageRoute(builder: (BuildContext context)=>Splashscreen());
      default :
        return CupertinoPageRoute(builder: (BuildContext context)=>LoginScreen());
    }
  }
}