import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Providers/ReviewsProvider/bloc/reviews_bloc.dart';

import '../../Models/review.dart';

class ReviewsWidget extends StatelessWidget {
  final int movieID;
  const ReviewsWidget(this.movieID, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewsBloc(movieID)
        ..add(
          ReviewsFetched(),
        ),
      child: const VisualReview(),
    );
  }
}

class VisualReview extends StatelessWidget {
  const VisualReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        switch (state.status) {
          case ReviewStatus.initial:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Reviews (${state.reviews.length})",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          case ReviewStatus.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Reviews (${state.reviews.length})",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                ...state.reviews.map((review) => SingleReview(review)).toList(),
              ],
            );
          case ReviewStatus.failure:
            return const Center(child: Text('failed to fetch reviews'));
        }
      },
    );
  }
}

class SingleReview extends StatelessWidget {
  final Review review;
  const SingleReview(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            child: review.author.avatarPath != ""
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: CachedNetworkImage(
                      imageUrl: review.author.avatarPath.length > 35
                          ? review.author.avatarPath.substring(1)
                          : "https://image.tmdb.org/t/p/w500${review.author.avatarPath}",
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                : const Text("User"),
          ),
          title: Wrap(
            children: [
              Text(
                "By ${review.author.username}",
                maxLines: 1,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          subtitle: Text(
            "Review created: ${review.getDate}",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Text(
          review.content,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.start,
        ),
        //here the line
        const Divider(
          color: Color.fromARGB(255, 177, 175, 175),
          height: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
