import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/movie_detail_model/movie_detail_model.dart';

class InfoBar extends StatelessWidget {
  const InfoBar(
      {Key key, this.keyString, this.valueString, this.icon, this.languages})
      : super(key: key);
  final String keyString;
  final String valueString;
  final IconData icon;
  final List<SpokenLang> languages;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _buildIcon(icon),
                ),
                Text(
                  "$keyString",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (valueString != null)
            Text("$valueString",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white))),
          if (languages != null)
            for (var item in languages)
              Text(
                "${item.engName}",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.white),
                ),
              )
        ]));
  }

  Icon _buildIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
    );
  }
}
