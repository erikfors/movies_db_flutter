import 'package:movie_app/Models/movie.dart';

class MoviesList {
  List<Movie> _moviesList = [];
  int _page = 0;

  MoviesList(this._moviesList, this._page);

  MoviesList.empty() {
    _moviesList = List<Movie>.empty(growable: true);
    _page = 0;
  }

  void addMovie(Movie movie){
    _moviesList.add(movie);
  }

  int size(){
    return _moviesList.length;
  }

  int getPage(){
    _page++;
    return _page;
  }

  Movie get(int index){
    return _moviesList[index];
  }

  static MoviesList jsonToMovieList(Map<String, dynamic> response) {
    List<dynamic> results = response["results"];

    var moviesListResult = MoviesList.empty();

    for (var element in results) {
      Map<String, dynamic> currentElement = element;
      var movie = Movie.fromMap(currentElement);
      moviesListResult.addMovie(movie);
    }

    return moviesListResult;
  }
}
