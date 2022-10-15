import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

class MoviesState extends Equatable{
   final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState ;
  final String nowPlayingMassage ;
   final List<Movie> popularMovies;
   final RequestState  popularState ;
   final String  popularMassage ;
   final List<Movie> topRatedMovies;
   final RequestState topRatedState ;
   final String topRatedMassage ;



   const MoviesState({
     this.nowPlayingMovies =const [],
     this.nowPlayingState= RequestState.loading,
     this.nowPlayingMassage= '',
     this.popularMovies =const [],
     this.popularState= RequestState.loading,
     this.popularMassage= '',
     this.topRatedMovies =const [],
     this.topRatedState= RequestState.loading,
     this.topRatedMassage= ''
   });

   MoviesState copyWith({
      List<Movie>? nowPlayingMovies,
      RequestState? nowPlayingState,
     String? nowPlayingMassage ,
      List<Movie>? popularMovies,
      RequestState?  popularState ,
      String?  popularMassage ,
      List<Movie>? topRatedMovies,
      RequestState? topRatedState ,
      String? topRatedMassage ,

   }){
     return MoviesState(
        nowPlayingMovies : nowPlayingMovies?? this.nowPlayingMovies,
        nowPlayingState  : nowPlayingState ?? this.nowPlayingState,
         nowPlayingMassage :nowPlayingMassage?? this.nowPlayingMassage,
       popularMovies : popularMovies?? this.popularMovies,
       popularState  : popularState ?? this.popularState,
       popularMassage :popularMassage?? this.popularMassage,
       topRatedMovies : topRatedMovies?? this.topRatedMovies,
       topRatedState  : topRatedState ?? this.topRatedState,
       topRatedMassage :topRatedMassage?? this.topRatedMassage,
     );
}

   @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState ,
    nowPlayingMassage,
    popularMovies,
     popularState ,
    popularMassage ,
    topRatedMovies,
    topRatedState ,
    topRatedMassage ,
   ];
}