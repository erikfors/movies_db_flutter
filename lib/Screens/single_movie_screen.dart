import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/Models/movie.dart';
import 'package:movie_app/Widgets/MovieWidgets/rating_circle.dart';
import 'package:movie_app/Widgets/Utils/screen_size.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: ScreenSize.getWidth(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Movie.getGenres(movie.genre_ids),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Released Date: ${movie.getDate}",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    RatingCircle(movie.vote_average)
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RatingBar.builder(
                itemSize: 35,
                maxRating: 10,
                itemCount: 10,
                allowHalfRating: true,
                initialRating: movie.vote_average,
                ignoreGestures: true,
                glowColor: Colors.purple,
                unratedColor: const Color.fromARGB(255, 78, 64, 82),
                itemBuilder: ((ctx, _) => const Icon(
                      Icons.star,
                      color: Colors.purple,
                    )),
                onRatingUpdate: (_) {},
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "${movie.vote_average} Rating / ${movie.vote_count} Reviews",
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
            ],
          ),
        ),
      ),
    );
  }
}
