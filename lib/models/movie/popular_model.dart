import 'dart:convert';

class Popular {
  final int id;
  final bool adult;
  final String title;
  final double voteAverage;
  final String posterPath;
  Popular({
    required this.id,
    required this.adult,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
  });

  Popular copyWith({
    int? id,
    bool? adult,
    String? title,
    double? voteAverage,
    String? posterPath,
  }) {
    return Popular(
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

  factory Popular.fromMap(Map<String, dynamic> map) {
    return Popular(
      id: map['id']?.toInt() ?? 0,
      adult: map['adult'] ?? false,
      title: map['title'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Popular.fromJson(String source) =>
      Popular.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Popular(id: $id, adult: $adult, title: $title, voteAverage: $voteAverage, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Popular &&
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
