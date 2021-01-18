import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/loading/LoadingCard.dart';

class LoadingRow extends StatelessWidget {
  const LoadingRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          LoadingCard(),
          LoadingCard(),
          LoadingCard(),
        ],
      ),
    );
  }
}
