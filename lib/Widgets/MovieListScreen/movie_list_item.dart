import 'package:flutter/material.dart';
import 'package:movie_app/Models/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
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
                  errorBuilder: (context, error, stackTrace) => const Text("Failed..."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
