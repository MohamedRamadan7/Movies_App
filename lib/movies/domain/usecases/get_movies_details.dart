import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entites/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MovieDetail,MovieDetailsParameters>{

 final BaseMovieRepository baseMovieRepository;
  GetMoviesDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters)async {

   return await baseMovieRepository.getMoviesDetails(parameters);

  }

}


class MovieDetailsParameters extends Equatable
{
  final int movieId;
  const MovieDetailsParameters({
   required this.movieId,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}