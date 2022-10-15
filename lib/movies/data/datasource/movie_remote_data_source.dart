import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_massage_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMoviesDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);


}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
     if(response.statusCode ==200){
       return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
     }else{
       throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
     }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<MovieDetailModel> getMoviesDetails(MovieDetailsParameters parameters)async {
    final response = await Dio().get(ApiConstance.moviesDetailsPath(parameters.movieId));
    if(response.statusCode ==200){
      return MovieDetailModel.fromJson(response.data);
    }else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters)async {
    final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if(response.statusCode ==200){
      return List<RecommendationModel>.from((response.data['results'] as List).map((e) => RecommendationModel.fromJson(e)));
    }else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}