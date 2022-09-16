import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingbar extends StatelessWidget {
  const MyRatingbar({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 35,
      maxRating: 10,
      itemCount: 10,
      allowHalfRating: true,
      initialRating: voteAverage,
      ignoreGestures: true,
      glowColor: Colors.purple,
      unratedColor: const Color.fromARGB(255, 78, 64, 82),
      itemBuilder: ((ctx, _) => const Icon(
            Icons.star,
            color: Colors.purple,
          )),
      onRatingUpdate: (_) {},
    );
  }
}