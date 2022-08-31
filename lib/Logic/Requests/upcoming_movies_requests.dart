import 'package:dio/dio.dart';

import 'package:movie_app/Logic/secrets.dart';
import 'package:movie_app/Models/movies_list.dart';

class UpcomingMoviesRequest {
  static const String mainPath = "https://api.themoviedb.org/3";
  static const String upcomingMoviesPath = "/movie/upcoming";
  static const String apiKeyHeader = "?api_key=";
  static const String apiKey = Secrets.apiKey;
  static const String backHeader = "&language=en-US&page=";
  static const int page = 1;

  static Future<MoviesList> getUpcomingMovisAsync() async {
    return await callRequestUpcomingMovies(page);
  }

  static Future<MoviesList> callRequestUpcomingMovies(int page) async {
    var dio = Dio();
    MoviesList returnList;

    final response = await dio.get(mainPath +
        upcomingMoviesPath +
        apiKeyHeader +
        apiKey +
        backHeader +
        page.toString());

        returnList = MoviesList.jsonToMovieList(response.data);

    
  return returnList;
        
  }
}
