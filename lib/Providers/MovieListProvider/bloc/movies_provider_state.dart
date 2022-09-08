part of 'movies_provider_bloc.dart';

enum MovieStatus { initial,loading, success, failure }

class MoviesProviderState extends Equatable {
  final MovieStatus movieStatus;
  final MoviesList moviesList;
  final bool hasReachedMax;
  final int page;

  const MoviesProviderState({
    this.movieStatus = MovieStatus.initial,
    this.moviesList= const MoviesList.main(<Movie>[]),
    this.hasReachedMax = false,
    this.page = 1,
  });

  MoviesProviderState copyWith({
    MovieStatus? status,
    MoviesList? moviesList,
    bool? hasReachedMax,
    int? page,
  }) {
    return MoviesProviderState(
      movieStatus: status ?? movieStatus,
      moviesList: moviesList ?? this.moviesList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page
    );
  }

  @override
  String toString() {
    return '''MovieState { status: $movieStatus, hasReachedMax: $hasReachedMax, movies: ${moviesList.size()}, page: $page }''';
  }

  @override
  List<Object> get props => [movieStatus, moviesList, hasReachedMax];
}
