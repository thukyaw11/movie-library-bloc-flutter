import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/bloc/casts/cast_bloc.dart';
import 'package:movie_app/ui/components/BuildCastCard.dart';
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
              return BuildCastCard(
                castModel: state.castList.casts[index],
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
