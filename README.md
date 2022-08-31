## Movies App

### User Stories

#### REQUIRED

- [ ] User can view a list of movies (title, poster image, and overview) currently playing in theaters from the Movie Database API.
- [ ] Expose details of movie (ratings using RatingBar, popularity, and synopsis) in a separate activity.
- [ ] Allow video posts to be played in full-screen using the YouTubePlayerView.

#### BONUS

- [ ] Implement a shared element transition when user clicks into the details of a movie.
- [ ] Trailers for popular movies are played automatically when the movie is selected.
  - [ ] When clicking on a popular movie (i.e. a movie voted for more than 5 stars) the video should be played immediately.
  - [ ] Less popular videos rely on the detailed page should show an image preview that can initiate playing a YouTube video.
- [ ] Add a play icon overlay to popular movies to indicate that the movie can be played.
- [ ] Use Bloc.
- [ ] Add a rounded corners for the images.
- [ ] Views should be responsive for both landscape/portrait mode.
   - [ ] In portrait mode, the poster image, title, and movie overview is shown.
   - [ ] (In landscape mode, the rotated alternate layout should use the backdrop image instead and show the title and movie overview to the right of it.
- [ ] Display a nice default placeholder (facebook one)
- [ ] Improved the user interface by experimenting with styling and coloring.
- [ ] For popular movies (i.e. a movie voted for more than 5 stars), the full backdrop image is displayed. Otherwise, a poster image, the movie title, and overview is listed. Use Heterogenous RecyclerViews and use different ViewHolder layout files for popular movies and less popular ones.


### App Walkthough GIF

`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="YOUR_GIF_URL_HERE" width=250><br>

### Notes

-App uses Flutter, and Dart

## Open-source libraries used

* [DIO](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc. (use for http processing)
* [Flutter_Bloc](https://pub.dev/packages/flutter_bloc) - Widgets that make it easy to integrate blocs and cubits into Flutter. Built to work with package:bloc. (state managment solution)
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in Dart often involves having to override the == operator as well as hashCode. (To compare classes, reduces boilerplate code)
