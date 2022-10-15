import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/entites/movie_detail.dart';
import 'package:movies_app/movies/domain/entites/recommedation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';

class MoviesRepository extends BaseMovieRepository{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>>getNowPlaying()async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
     return Right(result);

    } on ServerException catch(failure)
    {
      return   Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
   final result = await baseMovieRemoteDataSource.getPopularMovies();

   try
   {
     return Right(result);

   }on ServerException catch(failure)
    {
     return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try
    {
      return Right(result);

    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetail>> getMoviesDetails(MovieDetailsParameters parameters)async {
    final result = await baseMovieRemoteDataSource.getMoviesDetails(parameters);

    try
    {
      return Right(result);

    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters recommendationParameters)async {
    final result = await baseMovieRemoteDataSource.getRecommendation(recommendationParameters);

    try
    {
      return Right(result);

    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }





}