import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String originalLanguage;
  final String posterPath;
  final double voteAverage;
  final List genres;
  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.originalLanguage,
    required this.posterPath,
    required this.voteAverage,
    required this.genres,
  });

  MovieDetail copyWith({
    int? id,
    String? title,
    String? overview,
    String? originalLanguage,
    String? posterPath,
    double? voteAverage,
    List? genres,
  }) {
    return MovieDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'originalLanguage': originalLanguage,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'genres': genres,
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      posterPath: map['poster_path'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      genres: List.from(map['genres']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetail(id: $id, title: $title, overview: $overview, originalLanguage: $originalLanguage, posterPath: $posterPath, voteAverage: $voteAverage, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetail &&
        other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.originalLanguage == originalLanguage &&
        other.posterPath == posterPath &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        originalLanguage.hashCode ^
        posterPath.hashCode ^
        voteAverage.hashCode ^
        genres.hashCode;
  }
}
