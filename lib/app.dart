import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Models/movie.dart';
import 'package:movie_app/Screens/movies_list_screen.dart';
import 'package:movie_app/Screens/single_movie_screen.dart';
import 'package:movie_app/Theme/appTheme.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: myRoutes,
      theme: MyTheme().theme,
    );
  }

  final myRoutes = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '/': (context, state, data) => const MoviesListScreen(),
        '/movie': (context, state, data) => MovieScreen(data as Movie),        
      },
    ),
  );
}



