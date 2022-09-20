part of 'reviews_bloc.dart';

enum ReviewStatus { initial, success, failure }

class ReviewsState extends Equatable {
  final ReviewStatus status;
  final List<Review> reviews;

  const ReviewsState(
      {this.status = ReviewStatus.initial, this.reviews = const <Review>[]});

  ReviewsState copyWith({
    ReviewStatus? status,
    List<Review>? reviews,
  }) {
    return ReviewsState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, reviews: ${reviews.length} }''';
  }

  @override
  List<Object> get props => [status,reviews];
}

class ReviewsInitial extends ReviewsState {}
