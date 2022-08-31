import 'package:flutter/widgets.dart';
import 'package:movie_app/Logic/Requests/upcoming_movies_requests.dart';

import 'app.dart';

void main() async {
  //Bloc.observer = SimpleBlocObserver();
  var result = await UpcomingMoviesRequest.callRequestUpcomingMovies(1);
  for (int i = 0; i < result.size(); i++) {
    print(result.get(i));
  }
  runApp(const App());
}
