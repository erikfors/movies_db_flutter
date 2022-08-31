import 'package:equatable/equatable.dart';

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
      {required this.backdrop_path,
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
          popularity = value;
          break;
        case "poster_path":
          poster_path = value;
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
          backdrop_path = value;
          break;
        case "genre_ids":
          genre_ids = new List<int>.from(value);
          break;
        default:
      }
    });
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
