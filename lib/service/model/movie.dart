// lib/models/movie.dart
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String title;
  final int episode_id;
  final String opening_crawl;
  final String director;
  final String producer;
  final String release_date;
  final List<String> characters;

  Movie({
    required this.title,
    required this.episode_id,
    required this.opening_crawl,
    required this.director,
    required this.producer,
    required this.release_date,
    required this.characters,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
