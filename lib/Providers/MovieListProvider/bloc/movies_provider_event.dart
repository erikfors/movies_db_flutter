part of 'movies_provider_bloc.dart';

abstract class MoviesProviderEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class MovieFetched extends MoviesProviderEvent{}

class MovieLoading extends MoviesProviderEvent{}
