import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entites/recommedation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';



class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{

  final BaseMovieRepository baseMovieRepository;
  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters)async {

    return await baseMovieRepository.getRecommendation(parameters);

  }

}

class RecommendationParameters extends Equatable{
  final int id;

  const RecommendationParameters( this.id);

  @override
  List<Object?> get props => [id];

}


