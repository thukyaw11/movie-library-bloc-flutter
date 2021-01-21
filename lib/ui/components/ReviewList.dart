import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/reviews_model/reviews_model.dart';

class ReviewList extends StatelessWidget {
  final ReviewsModel result;
  ReviewList({this.result});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in result.results)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Text(
                  "${item.authorDetails.username}",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
