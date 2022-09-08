import 'package:movie_app/Models/movie.dart';

class MoviesList {
  final List<Movie> _moviesList;

  const MoviesList.main(this._moviesList);

  void addMovie(Movie movie) {
    _moviesList.add(movie);
  }

  int size() {
    return _moviesList.length;
  }

  Movie get(int index) {
    return _moviesList[index];
  }

  List<Movie> get getMovieList{
    return _moviesList;
  }

  static List<Movie> jsonToMovieList(Map<String, dynamic> response) {
    List<dynamic> results = response["results"];

    var moviesListResult = List<Movie>.empty(growable: true);

    for (var element in results) {
      Map<String, dynamic> currentElement = element;
      var movie = Movie.fromMap(currentElement);
      print(movie);
      moviesListResult.add(movie);
    }

    return moviesListResult;
  }

  static List<Movie> addMovies(List<Movie> currentMovies, List<Movie> newMovies){
    newMovies.addAll(currentMovies);
    return newMovies.reversed.toList();
  }
}
