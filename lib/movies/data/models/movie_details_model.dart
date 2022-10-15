import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entites/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
 const MovieDetailModel({
    required super.backdropPath,
    required super.id,
    required super.genres,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage
  });
  factory MovieDetailModel.fromJson(Map<String,dynamic>json) => MovieDetailModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x))),
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble()
  );
}