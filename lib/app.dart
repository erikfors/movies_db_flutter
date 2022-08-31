import 'package:flutter/material.dart';
import 'package:movie_app/Screens/movies_list_screen.dart';

class App extends MaterialApp {
  const App({super.key}) : super(home: const MoviesListScreen());
}