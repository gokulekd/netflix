import 'package:json_annotation/json_annotation.dart';

part 'database_response.g.dart';

@JsonSerializable()
class DatabaseResponse {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  bool? adult;
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  String? title;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  double? popularity;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  DatabaseResponse({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  factory DatabaseResponse.fromJson(Map<String, dynamic> json) {
    return _$DatabaseResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DatabaseResponseToJson(this);
}
