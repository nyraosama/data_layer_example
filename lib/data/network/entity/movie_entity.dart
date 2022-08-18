import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieListResponse{
  final List<MovieEntity> results;

  MovieListResponse({required this.results});

  factory MovieListResponse.fromJson(Map<String, dynamic> json)=>
      _$MovieListResponseFromJson(json);
}

@JsonSerializable()
class MovieEntity {
  final int id;
  final String title;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  final String overview;

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);
}
