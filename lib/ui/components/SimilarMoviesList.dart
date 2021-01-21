import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/bloc/simliar_movies/similar_movies_bloc.dart';
import 'package:movie_app/ui/components/MovieRow.dart';
import 'package:movie_app/ui/components/loading/LoadingRow.dart';

class SimilarMovieslist extends StatelessWidget {
  final int movieId;
  SimilarMovieslist({this.movieId});
  @override
  Widget build(BuildContext context) {
    final similarMoviesBloc = BlocProvider.of<SimilarMoviesBloc>(context);
    similarMoviesBloc.add(FetchSimilarMoviesEvent(movieId: movieId));
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
        builder: (context, state) {
      if (state is SimilarMoviesLoadingState) {
        return LoadingRow();
      }

      if (state is SimilarMoviesLoadedState) {
        return MovieRowList(
          allMoviesModel: state.similarMovies,
        );
      }

      if (state is SimilarMoviesEmptyState) {
        return Center(
            child: Text("No Similar Available",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey),
                )));
      }

      if (state is SimilarMoviesErrorState) {
        return CircularProgressIndicator(
          backgroundColor: Colors.red,
        );
      }

      return CircularProgressIndicator(
        backgroundColor: Colors.blue,
      );
    });
  }
}
