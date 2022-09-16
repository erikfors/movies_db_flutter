## Movies App

### User Stories

#### REQUIRED

- [x] User can view a list of movies (title, poster image, and overview) currently playing in theaters from the Movie Database API.
- [x] Expose details of movie (ratings using RatingBar, popularity, and synopsis) in a separate activity.
- [ ] Allow video posts to be played in full-screen using the YouTubePlayerView.

#### BONUS

- [ ] Implement a shared element transition when user clicks into the details of a movie.
- [ ] Trailers for popular movies are played automatically when the movie is selected.
  - [ ] When clicking on a popular movie (i.e. a movie voted for more than 5 stars) the video should be played immediately.
  - [ ] Less popular videos rely on the detailed page should show an image preview that can initiate playing a YouTube video.
- [ ] Add a play icon overlay to popular movies to indicate that the movie can be played.
- [x] Use Bloc.
- [x] Add a rounded corners for the images.
- [ ] Views should be responsive for both landscape/portrait mode.
   - [ ] In portrait mode, the poster image, title, and movie score is shown.
   - [ ] (In landscape mode, the rotated alternate layout should use the backdrop image instead and show the title and movie overview to the right of it.
- [ ] Display a nice default placeholder (facebook one)
- [x] Improved the user interface by experimenting with styling and coloring.


### App Walkthough GIF

`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="YOUR_GIF_URL_HERE" width=250><br>

### Notes

-App uses Flutter, and Dart

## Open-source libraries used

* [DIO](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc. (use for http processing)
* [Flutter_Bloc](https://pub.dev/packages/flutter_bloc) - Widgets that make it easy to integrate blocs and cubits into Flutter. Built to work with package:bloc. (state managment solution)
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in Dart often involves having to override the == operator as well as hashCode. (To compare classes, reduces boilerplate code)
* [Beamer](https://pub.dev/packages/beamer) - Beamer uses the power of Router and implements all the underlying logic for you, letting you explore arbitrarily complex navigation scenarios with ease.
* [intl](https://pub.dev/packages/intl) - Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
* [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar) - A simple yet fully customizable rating bar for flutter which also include a rating bar indicator, supporting any fraction of rating.
