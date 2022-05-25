import 'dart:convert';

class Upcoming {
  final int id;
  final bool adult;
  final String title;
  final double voteAverage;
  final String posterPath;
  Upcoming({
    required this.id,
    required this.adult,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
  });

  Upcoming copyWith({
    int? id,
    bool? adult,
    String? title,
    double? voteAverage,
    String? posterPath,
  }) {
    return Upcoming(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'adult': adult,
      'title': title,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
    };
  }

  factory Upcoming.fromMap(Map<String, dynamic> map) {
    return Upcoming(
      id: map['id']?.toInt() ?? 0,
      adult: map['adult'] ?? false,
      title: map['title'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Upcoming.fromJson(String source) =>
      Upcoming.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Upcoming(id: $id, adult: $adult, title: $title, voteAverage: $voteAverage, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Upcoming &&
        other.id == id &&
        other.adult == adult &&
        other.title == title &&
        other.voteAverage == voteAverage &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        adult.hashCode ^
        title.hashCode ^
        voteAverage.hashCode ^
        posterPath.hashCode;
  }
}
