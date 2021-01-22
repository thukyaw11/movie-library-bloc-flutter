import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/network/models/bloc/movies/movies_bloc.dart';
import 'package:movie_app/network/models/movie_model/movies_model.dart';
import 'package:movie_app/ui/components/LoadMoreCard.dart';
import 'package:movie_app/ui/components/MovieCard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  MoviesModel allMovies;
  int pageId = 1;
  var myDynamicAspectRatio = 1000 / 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final _topRateBloc = BlocProvider.of<MoviesBloc>(context);
    _topRateBloc..add(FetchMoviesEvent(type: "popular", pageId: pageId));

    final orientation = MediaQuery.of(context).orientation;

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            ),
          );
        }

        if (state is MoviesErrorState) {
          return Center(
            child: Text(
              "There was an error on fetching data",
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is MoviesLoadedState) {
          allMovies = state.movies;
          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropHeader(),
            controller: _refreshController,
            onRefresh: () async {
              _topRateBloc..add(FetchMoviesEvent(type: "popular", pageId: 1));
              _refreshController.loadComplete();
            },
            child: GridView.builder(
              itemCount: state.movies.movie.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index == allMovies.movie.length) {
                  return InkWell(
                    child: LoadMoreCard(),
                    onTap: () => _topRateBloc
                      ..add(
                          FetchMoviesEvent(type: "popular", pageId: ++pageId)),
                  );
                }

                if (index + 1 == allMovies.movie.length && pageId != 1) {
                  return InkWell(
                    child: LoadMoreCard(
                      direction: 'back',
                    ),
                    onTap: () => _topRateBloc
                      ..add(
                          FetchMoviesEvent(type: "popular", pageId: --pageId)),
                  );
                }
                if (index != allMovies.movie.length)
                  return MovieCard(
                    index: index,
                    moviesModel: allMovies.movie,
                    nameDisplay: false,
                  );
              },
            ),
          );
        }

        return Center(
          child: Text(
            "There was an error on fetching data",
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }
}
