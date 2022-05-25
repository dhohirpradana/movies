import 'dart:convert';

import 'package:flutter/foundation.dart';

class TVDetail {
  final int id;
  final String name;
  final String overview;
  final String originalLanguage;
  final String posterPath;
  final double voteAverage;
  final List genres;
  TVDetail({
    required this.id,
    required this.name,
    required this.overview,
    required this.originalLanguage,
    required this.posterPath,
    required this.voteAverage,
    required this.genres,
  });

  TVDetail copyWith({
    int? id,
    String? name,
    String? overview,
    String? originalLanguage,
    String? posterPath,
    double? voteAverage,
    List? genres,
  }) {
    return TVDetail(
      id: id ?? this.id,
      name: name ?? this.name,
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
      'name': name,
      'overview': overview,
      'originalLanguage': originalLanguage,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'genres': genres,
    };
  }

  factory TVDetail.fromMap(Map<String, dynamic> map) {
    return TVDetail(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      posterPath: map['poster_path'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      genres: List.from(map['genres']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TVDetail.fromJson(String source) =>
      TVDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TVDetail(id: $id, name: $name, overview: $overview, originalLanguage: $originalLanguage, posterPath: $posterPath, voteAverage: $voteAverage, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TVDetail &&
        other.id == id &&
        other.name == name &&
        other.overview == overview &&
        other.originalLanguage == originalLanguage &&
        other.posterPath == posterPath &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        overview.hashCode ^
        originalLanguage.hashCode ^
        posterPath.hashCode ^
        voteAverage.hashCode ^
        genres.hashCode;
  }
}
