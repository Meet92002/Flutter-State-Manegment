import 'package:app_exceptions/data/response/api_response.dart';
import 'package:app_exceptions/model/movies_model.dart';
import 'package:app_exceptions/respository/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewViewModel with ChangeNotifier{

  final _myRepo =HomeRepository();

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();
  setMovieList(ApiResponse<MovieListModel>response){
    movieList = response;
    notifyListeners();

  }

  Future<void> fetchMoviesListApi () async{
    setMovieList(ApiResponse.loading());  
    _myRepo.fetchMoviesList().then((value){
      setMovieList(ApiResponse.completed(value));
  }).onError((error, stackTrace){
      setMovieList(ApiResponse.error(error.toString()));
    });


  }
}