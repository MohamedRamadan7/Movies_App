import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

class MoviesState extends Equatable{
   final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState ;
  final String nowPlayingMassage ;


   const MoviesState({
     this.nowPlayingMovies =const [],
     this.nowPlayingState= RequestState.loading,
     this.nowPlayingMassage= ''
   });

   @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState ,
     nowPlayingMassage
   ];
}