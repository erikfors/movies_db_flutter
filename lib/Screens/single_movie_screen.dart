import 'package:flutter/material.dart';
import 'package:movie_app/Models/movie.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
    );
  }
}