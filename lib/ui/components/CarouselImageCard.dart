import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselImageCard extends StatelessWidget {
  String name;
  String img;
  CarouselImageCard({this.img, this.name});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Stack(
        children: [
          Image.network(
            img,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                '$name',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
