import 'package:flutter/material.dart';

class LoadMoreCard extends StatelessWidget {
  final String direction;
  LoadMoreCard({this.direction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: 130,
      child: Icon(
        direction == 'back' ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 50,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(5)),
    );
  }
}

class LoadMoreCardLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 130,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.yellow,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(5)),
    );
  }
}

class CastLoadMore extends StatelessWidget {
  final String direction;
  CastLoadMore({this.direction});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
      child: Container(
        height: 30,
        width: 30,
        child: Icon(
          direction == 'back' ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 20,
        ),
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(1000)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    );
  }
}
