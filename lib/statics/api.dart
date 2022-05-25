class BaseUrl {
  static String apiKey = "4a8d660fdeebedfe22bc20d751c367ac";
  static String tmdb = "https://api.themoviedb.org/3";

  static String tmdbImage = "https://image.tmdb.org/t/p/original";

  // Movies
  static String popularMovie = "$tmdb/movie/popular?api_key=$apiKey";
  static String upcomingMovie = "$tmdb/movie/upcoming?api_key=$apiKey";
  static String nowPlayingMovie = "$tmdb/movie/now_playing?api_key=$apiKey";

  static String detailMovie(int id) {
    return "$tmdb/movie/$id?api_key=$apiKey";
  }

  static String reviewsMovie(int id) {
    return "$tmdb/movie/$id/reviews?api_key=$apiKey";
  }

  // TVs
  static String onTheAirTv = "$tmdb/tv/on_the_air?api_key=$apiKey";
  static String popularTv = "$tmdb/tv/popular?api_key=$apiKey";

  static String detailTV(int id) {
    return "$tmdb/tv/$id?api_key=$apiKey";
  }

  static String reviewsTV(int id) {
    return "$tmdb/tv/$id/reviews?api_key=$apiKey";
  }
}
