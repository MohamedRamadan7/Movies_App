part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailState ;
  final String movieDetailMassage ;
  final List<Recommendation> recommendation;
  final RequestState recommendationState ;
  final String recommendationMassage ;

 const MovieDetailsState({
      this.movieDetail ,
      this.movieDetailState = RequestState.loading,
      this.movieDetailMassage = '',
      this.recommendation =const [],
      this.recommendationState = RequestState.loading,
      this.recommendationMassage ='',
   });

  MovieDetailsState copyWith({
     MovieDetail? movieDetail,
     RequestState? movieDetailState ,
     String? movieDetailMassage ,
    List<Recommendation>?  recommendation,
    RequestState? recommendationState ,
    String? recommendationMassage ,
  }){
  return MovieDetailsState(
    movieDetail: movieDetail ?? this.movieDetail,
    movieDetailState: movieDetailState ?? this.movieDetailState,
    movieDetailMassage: movieDetailMassage ?? this.movieDetailMassage,
    recommendation: recommendation ?? this.recommendation,
    recommendationState: recommendationState ?? this.recommendationState,
    recommendationMassage: recommendationMassage ?? this.recommendationMassage
  );
}

  @override
  List<Object?> get props => [
    movieDetail,
    movieDetailState,
    movieDetailMassage,
    recommendation,
    recommendationState,
    recommendationMassage
  ];
}


