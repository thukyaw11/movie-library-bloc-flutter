import 'package:dio/dio.dart';
import 'package:movie_app/network/models/cast_model/casts_model.dart';
import 'package:movie_app/network/models/movie_detail_model/movie_detail_model.dart';
import 'package:movie_app/network/models/movie_model/movies_model.dart';
import 'package:movie_app/network/models/reviews_model/reviews_model.dart';
import 'package:movie_app/network/models/videos_model/videos_model.dart';
import 'package:retrofit/retrofit.dart';

import 'models/movie_detail_cast_model/movies_detail_cast_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
// https://api.themoviedb.org/3/person/popular?api_key=02d007f9d32d6fa8d67bf53d2a8bf8d9
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    return ApiService(dio);
  }

  @GET("movie/{paramType}")
  Future<MoviesModel> getMovieList(@Path() String paramType,
      @Query("page") int pageId, @Query("api_key") String apiKey);

  @GET("person/popular")
  Future<CastsModel> getCastList(@Query("api_key") String apiKey);

  @GET("movie/{movieId}")
  Future<MovieDetail> getMovieDetail(
      @Path() int movieId, @Query("api_key") String apiKey);

  @GET("movie/{movieId}/credits")
  Future<MoviesDetailCastModel> getCastFromMovieDetail(
      @Path() int movieId, @Query("api_key") String apiKey);

  @GET("movie/{movieId}/similar")
  Future<MoviesModel> getSimilarMoviesList(
      @Path() int movieId, @Query("api_key") String apiKey);

  @GET("movie/{movieId}/videos")
  Future<VideosModel> getVideosList(
      @Path() int movieId, @Query("api_key") String apiKey);

  @GET("movie/{movieId}/reviews")
  Future<ReviewsModel> getReviewsList(
      @Path() int movieId, @Query("api_key") String apiKey);
}
