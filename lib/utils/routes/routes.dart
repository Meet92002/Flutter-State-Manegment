import 'package:app_exceptions/utils/routes/routes_name.dart';
import 'package:app_exceptions/view/home_screen.dart';
import 'package:app_exceptions/view/login_view.dart';
import 'package:app_exceptions/view/signp_view.dart';
import 'package:app_exceptions/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final argume = settings.arguments;

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> const SignUpView());
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