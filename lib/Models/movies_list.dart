import 'package:movie_app/Models/movie.dart';

class MoviesList {
  List<Movie> _moviesList = [];

  MoviesList(this._moviesList);

  MoviesList.empty() {
    _moviesList = List<Movie>.empty(growable: true);
  }

  void addMovie(Movie movie){
    _moviesList.add(movie);
  }

  int size(){
    return _moviesList.length;
  }

  Movie get(int index){
    return _moviesList[index];
  }

  static MoviesList jsonToMovieList(Map<String, dynamic> response) {
    List<dynamic> results = response["results"];

    var moviesListResult = MoviesList.empty();

    results.forEach((element) {
      Map<String, dynamic> currentElement = element;
      var movie = Movie.fromMap(currentElement);
      moviesListResult.addMovie(movie);
    });

    return moviesListResult;
  }
}
