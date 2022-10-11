class ApiConstance{
  static const String baseUrl ='https://api.themoviedb.org/3';
  static const String apiKey ='8253a3fad4cfa6023f598e6ac18803a6';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath =''
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String baseImageUrl ='https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path)=>'$baseImageUrl$path';




}