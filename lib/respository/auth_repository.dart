import 'package:app_exceptions/data/network/BaseApiService.dart';
import 'package:app_exceptions/data/network/NetworkApiService.dart';
import 'package:app_exceptions/res/app_url.dart';

class AuthRepository{

  NetworkApiService _apiServices =NetworkApiService();

  Future<dynamic>loginApi(dynamic data)async{

    try{
      dynamic response = await _apiServices.getpostApiResponse(AppUrl. loginEndPoint,data);
      return response;
  }catch(e){
      throw e;
  }
}

  Future<dynamic>registerApi(dynamic data)async{

    try{
      dynamic response = await _apiServices.getpostApiResponse(AppUrl.registerApEndPoint,data);
      return response;
    }catch(e){
      throw e;
    }
  }

}