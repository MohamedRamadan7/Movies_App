import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc( this.getNowPlayingMoviesUseCase): super(const MoviesState()){
    on<GetNowPlayingEvent>((event, emit)async {
      final result= await getNowPlayingMoviesUseCase.execute();
      print(result);
      result.fold((l) =>
          emit(MoviesState(
              nowPlayingState:RequestState.error,
            nowPlayingMassage: l.massage
          )),
              (r) => emit(MoviesState(
                nowPlayingMovies: r,
                  nowPlayingState:RequestState.loaded,
              )));
    });
  }
}