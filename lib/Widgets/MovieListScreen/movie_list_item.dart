import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Models/movie.dart';
import 'package:movie_app/Widgets/MovieWidgets/rating_circle.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 41, 40, 40),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Beamer.of(context).beamToNamed(
            "/movie",
            data: movie,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w342${movie.poster_path}",
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      width: double.infinity,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: -20,
                    child: RatingCircle(movie.vote_average),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Hero(
                createRectTween: (begin, end) =>
                    MaterialRectCenterArcTween(begin: begin, end: end),
                tag: movie.title,
                child: Wrap(children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
              
                ]),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(movie.getDate)
            ],
          ),
        ),
      ),
    );
  }
}
