import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/cast_model/cast_model.dart';
import 'package:movie_app/ui/pages/CastDetail.dart';

class BuildCastCard extends StatelessWidget {
  const BuildCastCard({Key key, this.castModel}) : super(key: key);

  final CastModel castModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => CastDetail(
                    personId: castModel.id,
                    name: castModel.name,
                    populiarity: castModel.popularity,
                    profilePath: castModel.profilePath)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: castModel.profilePath != null
                    ? "https://image.tmdb.org/t/p/original${castModel.profilePath}"
                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGyb4uoKEITC5H0mo3gEtXpr4tYRUt9Wz8vg&usqp=CAU",
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      value: downloadProgress.progress,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${castModel.name}",
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
