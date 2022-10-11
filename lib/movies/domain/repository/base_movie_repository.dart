import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<Movie>>>getNowPlaying();
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getTopNowRatedMovies();

}