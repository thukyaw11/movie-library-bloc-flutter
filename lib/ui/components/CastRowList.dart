import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/bloc/casts/cast_bloc.dart';
import 'package:movie_app/ui/components/loading/LoadingRow.dart';

class CastRowList extends StatelessWidget {
  const CastRowList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _castBloc = BlocProvider.of<CastBloc>(context);
    _castBloc..add(FetchCastEvent());

    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastLoadingState) {
        return LoadingRowCast();
      }

      if (state is CastLoadedState) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 13),
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.castList.casts.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                            "https://image.tmdb.org/t/p/original${state.castList.casts[index].profilePath}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
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
                      "${state.castList.casts[index].name}",
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  )
                ],
              );
            },
          ),
        );
      }

      return CircularProgressIndicator(
        backgroundColor: Colors.red,
      );
    });
  }
}
