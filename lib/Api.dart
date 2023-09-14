import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/MoviesResponse.dart';

class Api{
  ///https://api.themoviedb.org/3/movie/popular?languge=en-US&page=1&api_key=b5c3ddf257e8c41f49149711136cb2e9
  static const String baseUrl = 'api.themoviedb.org';
  static const String imageBseUrl = 'https://image.tmdb.org/t/p/original' ;
  static Future<MoviesResponse> getPopular()async{
    try {
      var url = Uri.https(baseUrl,'/3/movie/popular',{
        "api_key":"b5c3ddf257e8c41f49149711136cb2e9",
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var popularResponse = MoviesResponse.fromJson(json);
      return popularResponse;
    }catch(e){
      print(e);
      throw (e) ;
    }
  }

  ///https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=b5c3ddf257e8c41f49149711136cb2e9

  static Future<MoviesResponse> getComing()async{
    try {
      var url = Uri.https(baseUrl,'/3/movie/upcoming',{
        "api_key":"b5c3ddf257e8c41f49149711136cb2e9",
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var comingResponse = MoviesResponse.fromJson(json);
      return comingResponse;
    }catch(e){
      throw (e) ;
    }
  }

  ///https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=b5c3ddf257e8c41f49149711136cb2e9



  static Future<MoviesResponse> getTop()async{
    try {
      var url = Uri.https(baseUrl,'/3/movie/top_rated',{
        "api_key":"b5c3ddf257e8c41f49149711136cb2e9",
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var topResponse = MoviesResponse.fromJson(json);
      return topResponse;
    }catch(e){
      throw (e) ;
    }
  }



  static Future<MoviesResponse> getSimilar({required dynamic id})async{
    try {
      var url = Uri.https(baseUrl,'/3/movie/$id/similar',{
        "api_key":"b5c3ddf257e8c41f49149711136cb2e9",
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var topResponse = MoviesResponse.fromJson(json);
      return topResponse;
    }catch(e){
      throw (e) ;
    }
  }

  /// https://api.themoviedb.org/3/search/movie?query=q&include_adult=false&language=en-US&page=1

  static Future<MoviesResponse> getSearch({String? searchKey})async{
    try {
      var url = Uri.https(baseUrl,'/3/search/movie',{
        "api_key":"b5c3ddf257e8c41f49149711136cb2e9",
        "query" : searchKey
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var popularResponse = MoviesResponse.fromJson(json);
      return popularResponse;
    }catch(e){
      print(e);
      throw (e) ;
    }
  }

  ///https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc

  static Future<MoviesResponse> getCategory(dynamic categoryId)async{
    try {
      var url = Uri.https(baseUrl,'/3/discover/movie',{
        "api_key":"b5c3ddf257e8c41f49149711136cb2e9",
        "genre_ids" : categoryId
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var popularResponse = MoviesResponse.fromJson(json);
      return popularResponse;
    }catch(e){
      print(e);
      throw (e) ;
    }
  }
}

///apiKey : b5c3ddf257e8c41f49149711136cb2e9