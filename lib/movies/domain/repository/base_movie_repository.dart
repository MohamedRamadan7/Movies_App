import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/entites/movie_detail.dart';
import 'package:movies_app/movies/domain/entites/recommedation.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<Movie>>>getNowPlaying();
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetail>>getMoviesDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>>getRecommendation(RecommendationParameters recommendationParameters);



}