import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Movie extends Equatable {
  late int id;
  late String original_language;
  late String original_title;
  late String overview;
  late double popularity;
  late String poster_path;
  late DateTime release_date;
  late String title;
  late double vote_average;
  late int vote_count;
  late String backdrop_path;
  late List<int> genre_ids;

  Movie(
      {this.backdrop_path = "",
      required this.genre_ids,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.vote_average,
      required this.vote_count});

  Movie.fromMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      switch (key) {
        case "id":
          id = value;
          break;
        case "original_language":
          original_language = value;
          break;
        case "original_title":
          original_title = value;
          break;
        case "overview":
          overview = value;
          break;
        case "popularity":
          popularity = value ?? 0.0;
          break;
        case "poster_path":
          poster_path = value ?? "";
          break;
        case "release_date":
          release_date = DateTime.parse(value);
          break;
        case "title":
          title = value;
          break;
        case "vote_average":
          vote_average = value + 0.0;
          break;
        case "vote_count":
          vote_count = value;
          break;
        case "backdrop_path":
          backdrop_path = value ?? "";
          break;
        case "genre_ids":
          genre_ids = List<int>.from(value);
          break;
        default:
      }
    });
  }

  String get getDate{
    final dateFormat = DateFormat("MMM dd, yyyy");
    return dateFormat.format(release_date);
  }

  static String getGenres(List<int> genresIDs) {
    String returnString = "";

    for (int i = 0; i < genresIDs.length; i++) {
      switch (genresIDs[i]) {
        case 28:
          returnString += "Action-";
          break;
        case 12:
          returnString += "Adventure-";
          break;
        case 16:
          returnString += "Animation-";
          break;
        case 80:
          returnString += "Crime-";
          break;
        case 35:
          returnString += "Comedy-";
          break;
        case 18:
          returnString += "Drama-";
          break;
        case 10751:
          returnString += "Family-";
          break;
        case 14:
          returnString += "Fantasy-";
          break;
        case 36:
          returnString += "History-";
          break;
        case 27:
          returnString += "Horror-";
          break;
        case 10402:
          returnString += "Music-";
          break;
        case 9648:
          returnString += "Mystery-";
          break;
        case 10749:
          returnString += "Romance-";
          break;
        case 878:
          returnString += "Science Fiction-";
          break;
        case 10770:
          returnString += "TV Movie-";
          break;
        case 99:
          returnString += "Documentary-";
          break;
        case 53:
          returnString += "Thriller-";
          break;
        case 10752:
          returnString += "War-";
          break;
        case 37:
          returnString += "Western-";
          break;
        default:
          returnString += "Unkown-";
      }
    }

    return returnString.substring(0, returnString.length - 1);
  }

  @override
  String toString() {
    var returnString = "id: $id Title: $title Popularity: $popularity";

    return returnString;
  }

  @override
  List<Object> get props => [
        id,
        original_language,
        original_title,
        overview,
        popularity,
        poster_path,
        release_date,
        title,
        vote_average,
        vote_count,
        backdrop_path,
        genre_ids,
      ];
}
