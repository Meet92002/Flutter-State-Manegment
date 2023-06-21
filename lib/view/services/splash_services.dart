import 'package:app_exceptions/model/user_model.dart';
import 'package:app_exceptions/utils/routes/routes_name.dart';
import 'package:app_exceptions/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{

    getUserData().then((value)async{
      print(value.token.toString());

    if(value.token == 'null' || value.token == ''){
     await Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context,RoutesName.login);
    }else{
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context,RoutesName.home);
    }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}