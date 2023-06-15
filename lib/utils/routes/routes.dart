import 'package:app_exceptions/utils/routes/routes_name.dart';
import 'package:app_exceptions/view/home_screen.dart';
import 'package:app_exceptions/view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final argume = settings.arguments;

    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });


    }
  }
}