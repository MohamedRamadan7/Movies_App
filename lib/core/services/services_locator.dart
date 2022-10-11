
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl =GetIt.instance;

class ServicesLocator{
  
  void init(){
    /// BLOC
    sl.registerFactory(() => MoviesBloc(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    /// REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));
    
    /// USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

  }
}