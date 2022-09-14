import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Models/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Color.fromARGB(255, 41, 40, 40),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Beamer.of(context).beamToNamed("/movie", data: movie),
          child: Card(
            color: Color.fromARGB(255, 20, 20, 20),
            elevation: 12,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w342${movie.poster_path}",
                    height: 200,
                    width: 100,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text("Failed..."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 225,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Wrap(
                          children: [
                            Text(
                              movie.overview,
                              maxLines: 7,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
