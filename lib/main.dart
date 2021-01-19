import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/bloc/cast_bloc.dart';
import 'package:movie_app/network/models/bloc/movies_bloc.dart';
import 'package:movie_app/ui/MyHomePage.dart';
import 'package:movie_app/utils/CustomColor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CustomColor customColor = new CustomColor();
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<MoviesBloc>(
                  create: (context) => MoviesBloc(api: apiService)),
              BlocProvider<CastBloc>(
                  create: (context) => CastBloc(api: apiService))
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: customColor.black,
              ),
              home: MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}
