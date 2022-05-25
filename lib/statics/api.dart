class BaseUrl {
  static String apiKey = "4a8d660fdeebedfe22bc20d751c367ac";
  static String tmdb = "https://api.themoviedb.org/3";
  static String tmdbImage = "https://image.tmdb.org/t/p/original";
  static String uriPopular = "$tmdb/movie/popular?api_key=$apiKey";
  static String uriUpcoming = "$tmdb/movie/upcoming?api_key=$apiKey";
  static String uriNowPlaying = "$tmdb/movie/now_playing?api_key=$apiKey";
}
