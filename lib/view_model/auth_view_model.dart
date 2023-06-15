import 'package:app_exceptions/respository/auth_repository.dart';
import 'package:app_exceptions/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
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

}