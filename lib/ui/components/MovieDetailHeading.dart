import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailHeading extends StatelessWidget {
  const MovieDetailHeading({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.yellow, fontSize: 18),
            ),
          ),
          Container(
            height: 6,
            width: 40,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
