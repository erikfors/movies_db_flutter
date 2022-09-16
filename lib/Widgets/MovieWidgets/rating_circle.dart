import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class RatingCircle extends StatelessWidget {
  final double rating;
  const RatingCircle(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(221, 43, 42, 44),
      ),
      child: CircularPercentIndicator(
        animation: true,
        circularStrokeCap: CircularStrokeCap.butt,
        linearGradient: getLinearGardient(rating * 10),
        radius: 20,
        percent: rating / 10,
        center: Center(child: TextPercent(rating * 10)),
      ),
    );
  }

  LinearGradient getLinearGardient(double rating) {
    if (rating < 50) {
      return const LinearGradient(
          colors: [Colors.red, Color.fromARGB(255, 133, 29, 21)]);
    } else if (rating < 80) {
      return const LinearGradient(
          colors: [Colors.yellow, Color.fromARGB(255, 187, 170, 21)]);
    } else {
      return const LinearGradient(
          colors: [Colors.green, Color.fromARGB(255, 33, 94, 35)]);
    }
  }
}

class TextPercent extends StatelessWidget {
  final double rating;
  const TextPercent(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rating.toStringAsFixed(0),
          style: Theme.of(context).textTheme.headline6,
        ),
        const Text(
          "%",
          style: TextStyle(color: Colors.white, fontSize: 10),
        )
      ],
    );
  }
}
