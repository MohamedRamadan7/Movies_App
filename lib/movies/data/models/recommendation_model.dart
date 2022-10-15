import 'package:movies_app/movies/domain/entites/recommedation.dart';

class RecommendationModel extends Recommendation{

 const RecommendationModel({
    super.backdropPath,
   required super.id
 });
 factory RecommendationModel.fromJson(Map<String,dynamic>json) =>RecommendationModel(
     backdropPath: json['backdrop_path'] ?? '/hT3OqvzMqCQuJsUjZnQwA5NuxgK.jpg',
     id: json['id']);
}