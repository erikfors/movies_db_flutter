import 'package:flutter/material.dart';
import 'package:movie_app/Models/movie.dart';
import 'package:movie_app/Widgets/MovieWidgets/rating_circle.dart';
import 'package:movie_app/Widgets/MovieWidgets/review_widget.dart';
import 'package:movie_app/Widgets/MovieWidgets/youtube_player.dart';
import 'package:movie_app/Widgets/Utils/screen_size.dart';

import '../Widgets/MovieWidgets/rating_bar.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(child: YoutubePlayerWidget(movie.id)),
            isPortrait
                ? Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: movie.title,
                            child: Text(
                              movie.title,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: ScreenSize.getWidth(context),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Movie.getGenres(movie.genreIds),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Released Date: ${movie.getDate}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                                RatingCircle(movie.voteAverage)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          MyRatingbar(voteAverage: movie.voteAverage),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "${movie.voteAverage} Rating / ${movie.voteCount} Reviews",
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Overview",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Wrap(
                            children: [
                              Text(
                                movie.overview,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          ReviewsWidget(movie.id),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
