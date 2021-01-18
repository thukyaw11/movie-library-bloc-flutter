import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselImageCard extends StatelessWidget {
  String item;
  CarouselImageCard(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Stack(
        children: [
          Image.network(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                'Flash',
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
