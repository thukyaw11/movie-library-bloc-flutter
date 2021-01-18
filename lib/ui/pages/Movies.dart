import 'package:flutter/material.dart';
import 'package:movie_app/content/demo_data.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  var myDynamicAspectRatio = 1000 / 1;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;
    return GridView.builder(
      itemCount: topRatedList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemBuilder: (BuildContext context, int index) {
        // return MovieCard(listData: topRatedList, index: index);
      },
    );
  }
}
