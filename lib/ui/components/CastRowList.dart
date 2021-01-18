import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/content/demo_data.dart';

class CastRowList extends StatelessWidget {
  const CastRowList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: castList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 58,
                margin: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                    castList[index]['img'],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${castList[index]['name']}",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 10)),
              )
            ],
          );
        },
      ),
    );
  }
}
