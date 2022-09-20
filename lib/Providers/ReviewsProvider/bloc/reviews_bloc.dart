import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Logic/Requests/movie_reviews_request.dart';
import 'package:movie_app/Models/review.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final movieID;

  ReviewsBloc(this.movieID) : super(ReviewsInitial()) {
    on<ReviewsFetched>(_onReviewsFetched);
  }

  FutureOr<void> _onReviewsFetched(
      ReviewsFetched event, Emitter<ReviewsState> emit) async {
    try {
      final reviewsList = await MovieReviewsRequest.getMovieReviews(movieID);

      return emit(
          state.copyWith(status: ReviewStatus.success, reviews: reviewsList));
    } catch (_) {
      emit(state.copyWith(status: ReviewStatus.failure));
    }
  }
}
