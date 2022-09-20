import 'package:dio/dio.dart';

import '../../Models/review.dart';
import '../secrets.dart';

class MovieReviewsRequest {
  static const String mainPath = "https://api.themoviedb.org/3";
  static const String upcomingMoviesPath = "/movie/";
  //space for movie id
  static const String apiKeyHeader = "/reviews?api_key=";
  static const String apiKey = Secrets.apiKey;

  static Future<List<Review>> getMovieReviews(int movieID) async {
    var dio = Dio();
    List<Review> reviewList = [];
    try {
      final response = await dio.get(mainPath +
          upcomingMoviesPath +
          movieID.toString() +
          apiKeyHeader +
          apiKey);

      for (var reviewMap in response.data["results"]) {
        reviewList.add(Review.fromMap(reviewMap));
      }
    } catch (e) {
      rethrow;
    }

    return reviewList;
  }
}
