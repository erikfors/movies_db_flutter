import 'package:flutter/material.dart';
import 'package:movie_app/Screens/movies_list_screen.dart';

class App extends MaterialApp {
  App({super.key})
      : super(
          home: const MoviesListScreen(),
          theme: ThemeData(
            primarySwatch: Colors.purple,
            scaffoldBackgroundColor: Color.fromARGB(221, 39, 39, 39),
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
              headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
            ),
          ),
        );
}
