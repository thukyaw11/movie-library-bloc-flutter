import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/content/demo_data.dart';
import 'package:movie_app/network/models/bloc/movies/movies_bloc.dart';
import 'package:movie_app/ui/components/MovieRow.dart';
import 'package:movie_app/ui/components/loading/LoadingRow.dart';
import 'package:movie_app/ui/pages/Casts.dart';
import 'package:movie_app/ui/pages/Movies.dart';
import 'package:movie_app/ui/pages/Search.dart';
import 'package:movie_app/utils/FadeRoute.dart';
import 'components/CarouselImageCard.dart';
import 'components/Drawer.dart';
import 'components/CastRowList.dart';
import 'components/SliderHeader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int _currentIndex = 0;
  PageController _pageController;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _topRateBloc = BlocProvider.of<MoviesBloc>(context);
    _topRateBloc..add(FetchMoviesEvent(type: "popular", pageId: 1));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(FadeRoute(page: SearchPage()));
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                          ),
                          items: carouselItems
                              .map(
                                (item) => Center(
                                    child: CarouselImageCard(
                                  img: item['img'],
                                  name: item['name'],
                                )),
                              )
                              .toList(),
                        ),
                      ),
                      SliderHeader(
                        title: "Cast",
                      ),
                      CastRowList(),
                      SliderHeader(
                        title: "Up Coming",
                      ),
                      BlocBuilder<MoviesBloc, MoviesState>(
                        builder: (context, state) {
                          if (state is MoviesLoadingState) {
                            return LoadingRow();
                          }

                          if (state is MoviesErrorState) {
                            return Center(
                              child: Text("Error"),
                            );
                          }

                          if (state is MoviesLoadedState) {
                            return MovieRowList(
                              allMoviesModel: state.upComingMovies,
                            );
                          }

                          return CircularProgressIndicator(
                            backgroundColor: Colors.deepOrange,
                          );
                        },
                      ),
                      SliderHeader(
                        title: "Popular",
                      ),
                      BlocBuilder<MoviesBloc, MoviesState>(
                        builder: (context, state) {
                          if (state is MoviesLoadingState) {
                            return LoadingRow();
                          }

                          if (state is MoviesErrorState) {
                            return Center(
                              child: Text("Error"),
                            );
                          }

                          if (state is MoviesLoadedState) {
                            return MovieRowList(
                              allMoviesModel: state.popularMovies,
                            );
                          }

                          return CircularProgressIndicator(
                            backgroundColor: Colors.deepOrange,
                          );
                        },
                      ),
                      SliderHeader(
                        title: "Top Rated",
                      ),
                      BlocBuilder<MoviesBloc, MoviesState>(
                        builder: (context, state) {
                          if (state is MoviesLoadingState) {
                            return LoadingRow();
                          }

                          if (state is MoviesErrorState) {
                            return Center(
                              child: Text("Error"),
                            );
                          }

                          if (state is MoviesLoadedState) {
                            return MovieRowList(
                              allMoviesModel: state.movies,
                            );
                          }

                          return CircularProgressIndicator(
                            backgroundColor: Colors.deepOrange,
                          );
                        },
                      ),
                      // MovieRowList(
                      //   listData: topRatedList,
                      // ),
                      SliderHeader(
                        title: "Comedy",
                      ),
                      // MovieRowList(
                      //   listData: topRatedList,
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Movies(),
              ),
              Container(
                color: Colors.black,
                child: CastListPage(),
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text('Home', textAlign: TextAlign.center),
              activeColor: Colors.orange,
              inactiveColor: Colors.orangeAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.movie_outlined),
              title: Text('Movies', textAlign: TextAlign.center),
              activeColor: Colors.red,
              inactiveColor: Colors.redAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.people_outline),
              title: Text('Casts', textAlign: TextAlign.center),
              activeColor: Colors.blue,
              inactiveColor: Colors.blueAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.settings_outlined),
              title: Text(
                'Settings',
                textAlign: TextAlign.center,
              ),
              activeColor: Colors.pink,
              inactiveColor: Colors.pinkAccent),
        ],
      ),
    );
  }
}
