import 'package:app_exceptions/respository/auth_repository.dart';
import 'package:app_exceptions/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _sigUpLnoading = false;
  bool get sigUpLnoading => _sigUpLnoading;

  setLoading(bool value){
    _loading = value;
        notifyListeners();
  }
  setsigUpLnoading(bool value){
    _sigUpLnoading = value;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data,BuildContext context)async{
    setLoading(true);
  _myRepo.loginApi(data).then((value){
    setLoading(false);
    Utils.flushBArErrorMessage('Login Successfully', context);
      if(kDebugMode){
        print(value.toString());
    }
  }).onError((error, stackTrace){
    setLoading(false);
    if(kDebugMode){
      Utils.flushBArErrorMessage(error.toString(), context);
      print(error.toString());
    }
  });

  }

  Future<void>  signUpApi(dynamic data,BuildContext context)async{
    setsigUpLnoading(true);
    _myRepo.loginApi(data).then((value){
      setsigUpLnoading(false);
      Utils.flushBArErrorMessage('Signup Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setsigUpLnoading(false);
      if(kDebugMode){
        Utils.flushBArErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });

  }

}