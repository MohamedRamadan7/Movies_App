import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entites/genres.dart';

class MovieDetail extends Equatable{
  final String backdropPath;
  final int id;
  final List<Genres>genres;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;


 const MovieDetail({
   required this.backdropPath,
   required this.id,
   required this.genres,
   required this.overview,
   required  this.releaseDate,
   required  this.runtime,
   required  this.title,
   required  this.voteAverage});

  @override
  List<Object> get props => [
    backdropPath,
    id,
    genres,
    overview,
    releaseDate,
    runtime,
    title,
    voteAverage
  ];

}