class MovieModel {
  MovieModel({
    this.id,
    this.votes,
    this.originalTitle,
    this.originalLinguage,
    this.overview,
    this.poster,
    this.releaseDate,
    this.title,
  });

  final int? id;
  final num? votes;
  final String? originalTitle;
  final String? originalLinguage;
  final String? overview;
  final String? poster;
  final String? releaseDate;
  final String? title;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        votes: json["vote_average"],
        originalLinguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        poster: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
      );
}
