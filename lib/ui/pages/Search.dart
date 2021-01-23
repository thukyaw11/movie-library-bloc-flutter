import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/bloc/genres/genres_bloc.dart';
import 'package:movie_app/network/models/bloc/search/search_bloc.dart';
import 'package:movie_app/ui/components/MovieCard.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchTitle;
  String genreTitle;

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<GenresBloc>(context);
    final _searchBloc = BlocProvider.of<SearchBloc>(context);
    _bloc..add(FetchGenresEvent());
    _searchBloc..add(FetchSearchInitialEvent());

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 30) / 2;
    final double itemWidth = size.width / 2;

    // _movieBloc..add(FetchMoviesByGenre(genreId: 27, pageId: 1));

    return Scaffold(
      appBar: AppBar(
        title: _buildSearchField(),
        actions: _buildActions(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                if (state is SearchInitial) {
                  return Text("");
                }

                if (state is SearchDataLoadingState) {
                  return Text("loading",
                      style: TextStyle(color: Colors.yellow));
                }

                if (state is SearchDataLoadedState) {
                  return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.searchResults.searchResults.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: (itemWidth / itemHeight),
                        mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCard(
                        index: index,
                        moviesModel: state.searchResults.searchResults,
                      );
                    },
                  );
                }

                if (state is SearchDataErrorState) {
                  return Center(
                      child: Text(
                    "error",
                    style: TextStyle(color: Colors.red),
                  ));
                }

                return Center(
                    child: Text(
                  "error",
                  style: TextStyle(color: Colors.white),
                ));
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Categories you may like",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<GenresBloc, GenresState>(builder: (context, state) {
                if (state is GenresLoadingState) {
                  return Center(
                      child: Text(
                    "loading",
                    style: TextStyle(color: Colors.white),
                  ));
                }

                if (state is GenresErrorState) {
                  return Center(
                      child: Text(
                    "error",
                    style: TextStyle(color: Colors.white),
                  ));
                }

                if (state is GenresLoadedState) {
                  return Container(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        for (var item in state.genresModel.genres)
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              _searchBloc
                                  .add(FetchSearchDataEvent(genreId: item.id));
                              genreTitle = item.name;
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white10,
                              ),
                              child: Center(
                                child: Text(
                                  "${item.name}",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }

                return Center(
                    child: Text(
                  "error",
                  style: TextStyle(color: Colors.white),
                ));
              })
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildSearchField() {
    return TextField(
      cursorColor: Colors.white,
      controller: _searchQueryController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Search Movie ",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (_searchQueryController.text == '') {
              return;
            }
            genreTitle = '';
            searchTitle = _searchQueryController.text;
            BlocProvider.of<SearchBloc>(context).add(
                FetchSearchDataEventByQuery(
                    query: _searchQueryController.text));
            _searchQueryController.text = '';
          }),
    ];
  }
}
