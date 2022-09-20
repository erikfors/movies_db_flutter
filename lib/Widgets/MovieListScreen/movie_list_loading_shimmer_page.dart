import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieListsLoadingPage extends StatelessWidget {
  const MovieListsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var baseColor = const Color.fromARGB(255, 132, 33, 150);
    var highlightColor = const Color.fromARGB(255, 192, 145, 196);
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.49,
      children: [
        for (int i = 0; i < 6; i++)
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Text(
                    "Loading Title",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Text(
                    "Loading date",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// Material(
//       color: const Color.fromARGB(255, 41, 40, 40),
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         child: GestureDetector(
//           onTap: () => Beamer.of(context).beamToNamed(
//             "/movie",
//             data: movie,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 fit: StackFit.passthrough,
//                 clipBehavior: Clip.none,
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(16)),
//                     child: CachedNetworkImage(
//                       imageUrl:
//                           "https://image.tmdb.org/t/p/w342${movie.poster_path}",
//                       fit: BoxFit.fill,
//                       progressIndicatorBuilder:
//                           (context, url, downloadProgress) =>
//                               CircularProgressIndicator(
//                                   value: downloadProgress.progress),
//                       width: double.infinity,
//                       errorWidget: (context, url, error) =>
//                           const Icon(Icons.error),
//                     ),
//                   ),
//                   Positioned(
//                     left: 20,
//                     bottom: -20,
//                     child: RatingCircle(movie.vote_average),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 26,
//               ),
//               Flexible(
//                 child: Hero(
//                   createRectTween: (begin, end) =>
//                       MaterialRectCenterArcTween(begin: begin, end: end),
//                   tag: movie.title,
//                   child: Wrap(children: [
//                     Text(
//                       movie.title,
//                       style: Theme.of(context).textTheme.headline1,
//                     ),
                
//                   ]),
//                 ),
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//               Text(movie.getDate)
//             ],
//           ),
//         ),
//       ),
//     );