import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderHeader extends StatelessWidget {

  String title;

  SliderHeader({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: GoogleFonts.lato(
                color: Colors.yellow, fontSize: 15),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.yellow,
            icon: Icon(Icons.grid_on_rounded),
          )
        ],
      ),
    );
  }
}
