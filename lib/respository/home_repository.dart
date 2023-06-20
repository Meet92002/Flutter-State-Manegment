import 'package:app_exceptions/data/network/BaseApiService.dart';
import 'package:app_exceptions/model/movies_model.dart';

import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class HomeRepository{

  BaseApiServices _apiServices =NetworkApiService();

  Future<MovieListModel>fetchMoviesList()async{

    try{
      dynamic response = await _apiServices.getResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}