import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entites/movie_detail.dart';
import 'package:movies_app/movies/domain/entites/recommedation.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUseCase,this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);

  }
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase ;
  final GetRecommendationUseCase getRecommendationUseCase ;


  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
    final result = await getMoviesDetailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold((l) => emit(
        state.copyWith(
            movieDetailState: RequestState.error,
            movieDetailMassage:l.massage
        )),
            (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailState: RequestState.loaded
            )));

  }




  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold((l) => emit(
        state.copyWith(
            recommendationState: RequestState.error,
            recommendationMassage:l.massage
        )),
            (r) => emit(state.copyWith(
            recommendation: r,
            recommendationState: RequestState.loaded,
                movieDetail: null
        )));
  }
}
