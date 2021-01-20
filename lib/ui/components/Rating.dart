import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int ratingCount;
  RatingBar({this.ratingCount});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;

    if (index >= ratingCount) {
      print(ratingCount);
      icon = Icon(
        Icons.star_outline,
        color: Colors.yellow,
        size: 14,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: Colors.yellow,
        size: 14,
      );
    }

    return new InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: new List.generate(5, (index) => buildStar(context, index)));
  }
}
