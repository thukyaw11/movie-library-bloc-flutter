import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 170.0,
      height: 130.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.white38,
          child: Container(
            height: 170,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          )),
    );
  }
}

class LoadingCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
      child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.white38,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500), color: Colors.white),
          )),
    );
  }
}
