class MovieDetailModel {
  final String backdropPath,
      homepage,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      status,
      tagline,
      title;
  final int id, budget, revenue, runtime, voteCount;
  final num voteAverage, popularity;
  final bool adult, video;
  final List<dynamic> genres,
      productionCompanies,
      productionCountries,
      spokenLanguages;
  final Map<String, dynamic> belongsToCollection;

  // named constructor
  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        belongsToCollection = json['belongs_to_collection'],
        budget = json['budget'],
        genres = json['genres'],
        homepage = json['homepage'],
        id = json['id'],
        imdbId = json['imdb_id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        productionCompanies = json['production_companies'],
        productionCountries = json['production_countries'],
        releaseDate = json['release_date'],
        revenue = json['revenue'],
        runtime = json['runtime'],
        spokenLanguages = json['spoken_languages'],
        status = json['status'],
        tagline = json['tagline'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];
}
