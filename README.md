## Movies App

### User Stories

#### REQUIRED

- [x] User can view a list of movies (title, poster image, and overview) currently playing in theaters from the Movie Database API.
- [x] Expose details of movie (ratings using RatingBar, popularity, and synopsis) in a separate activity.
- [x] Allow video posts to be played in full-screen using the YouTubePlayerView.

#### BONUS

- [x] Implement a shared element transition when user clicks into the details of a movie.
- [x] When clicking on a popular movie (i.e. a movie voted for more than 5 stars) the video should be played immediately.
- [x] Use Bloc.
- [x] Add a rounded corners for the images.
- [x] Display a nice default placeholder 
- [x] Improved the user interface by experimenting with styling and coloring.
- [x] Add movies reviews


### App Walkthough GIF

<img src="app_walkthrough.gif" width=250><br>

### Notes

-App uses Flutter, and Dart

## Open-source libraries used

* [DIO](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc. (use for http processing)
* [Flutter_Bloc](https://pub.dev/packages/flutter_bloc) - Widgets that make it easy to integrate blocs and cubits into Flutter. Built to work with package:bloc. (state managment solution)
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in Dart often involves having to override the == operator as well as hashCode. (To compare classes, reduces boilerplate code)
* [Beamer](https://pub.dev/packages/beamer) - Beamer uses the power of Router and implements all the underlying logic for you, letting you explore arbitrarily complex navigation scenarios with ease.
* [intl](https://pub.dev/packages/intl) - Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
* [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar) - A simple yet fully customizable rating bar for flutter which also include a rating bar indicator, supporting any fraction of rating.
* [cached_network_image](https://pub.dev/packages/cached_network_image) - A flutter library to show images from the internet and keep them in the cache directory.
* [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter) - Flutter plugin for playing or streaming YouTube videos inline using the official iFrame Player API.
* [shimmer](https://pub.dev/packages/shimmer) - A package provides an easy way to add shimmer effect in Flutter project
* [percent_indicator ](https://pub.dev/packages/percent_indicator) - Circular and Linear percent indicators
