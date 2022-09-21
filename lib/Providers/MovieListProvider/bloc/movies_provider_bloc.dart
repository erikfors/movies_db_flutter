import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Logic/Requests/upcoming_movies_requests.dart';
import 'package:movie_app/Models/movies_list.dart';

import '../../../Models/movie.dart';
part 'movies_provider_event.dart';
part 'movies_provider_state.dart';

const throttleDuration = Duration(milliseconds: 100);

class MoviesProviderBloc
    extends Bloc<MoviesProviderEvent, MoviesProviderState> {
  MoviesProviderBloc() : super(const MoviesProviderState()) {
    on<MovieFetched>(
      _onMovieFetched,
      transformer: throttle(throttleDuration),
    );
    on<MovieLoading>(
      _onMovieLoading,
      transformer: throttle(throttleDuration),
    );
  }

  void _onMovieFetched(MovieFetched event, Emitter<MoviesProviderState> emit) {
    if (state.hasReachedMax) {
      return emit(state.copyWith(
          status: MovieStatus.loading,
          moviesList: state.moviesList,
          hasReachedMax: false));
    }
  }

  Future<void> _onMovieLoading(
      MovieLoading event, Emitter<MoviesProviderState> emit) async {
    try {
      
      var newMovieList =
          await UpcomingMoviesRequest.callRequestUpcomingMovies(state.page);

      var movieList = MoviesList.main(MoviesList.addMovies(state.moviesList.getMovieList.reversed.toList(), newMovieList.getMovieList.reversed.toList())) ;

      return emit(state.copyWith(
          status: MovieStatus.success,
          moviesList: movieList,
          hasReachedMax: false,
          page: state.page + 1));
    } catch (e) {
      //print(e.toString());
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }
}
