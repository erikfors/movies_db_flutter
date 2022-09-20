part of 'reviews_bloc.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();
  
  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}
