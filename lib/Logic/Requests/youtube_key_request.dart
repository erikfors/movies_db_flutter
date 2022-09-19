import 'package:dio/dio.dart';

import '../secrets.dart';

class YoutubeKeyRequest {
  static const String mainPath = "https://api.themoviedb.org/3";
  static const String upcomingMoviesPath = "/movie/";
  //space for movie id
  static const String apiKeyHeader = "/videos?api_key=";
  static const String apiKey = Secrets.apiKey;
  static const String backHeader = "&language=en-US";

  static Future<String> getMovieTrailerKey(int movieID) async {
    var dio = Dio();

    var key = "";

    try {
      final response = await dio.get(mainPath +
          upcomingMoviesPath +
          movieID.toString() +
          apiKeyHeader +
          apiKey +
          backHeader);

      for (var video in response.data["results"]) {
        key = video["key"];
        if (video["type"] == "Trailer") {
          return video["key"];
        }
      }
    } catch (e) {
      rethrow;
    }

    return key;
  }
}
