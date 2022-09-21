import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

//ignore: must_be_immutable
class Movie extends Equatable {
  late int id;
  late String overview;
  late double popularity;
  late String posterPath;
  late DateTime releaseDate;
  late String title;
  late double voteAverage;
  late int voteCount;
  late List<int> genreIds;

  Movie(
      {required this.genreIds,
      required this.id,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  Movie.fromMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      switch (key) {
        case "id":
          id = value;
          break;
        case "overview":
          overview = value;
          break;
        case "popularity":
          popularity = value ?? 0.0;
          break;
        case "poster_path":
          posterPath = value ?? "";
          break;
        case "release_date":
          releaseDate = DateTime.parse(value);
          break;
        case "title":
          title = value;
          break;
        case "vote_average":
          voteAverage = value + 0.0;
          break;
        case "vote_count":
          voteCount = value;
          break;
        case "genre_ids":
          genreIds = List<int>.from(value);
          break;
        default:
      }
    });
  }

  String get getDate {
    final dateFormat = DateFormat("MMM dd, yyyy");
    return dateFormat.format(releaseDate);
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
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
        genreIds,
      ];
}
