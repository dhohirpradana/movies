import 'dart:convert';

class UpcomingModel {
  final int id;
  final bool adult;
  final String title;
  final double voteAverage;
  final String posterPath;
  UpcomingModel({
    required this.id,
    required this.adult,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
  });

  UpcomingModel copyWith({
    int? id,
    bool? adult,
    String? title,
    double? voteAverage,
    String? posterPath,
  }) {
    return UpcomingModel(
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

  factory UpcomingModel.fromMap(Map<String, dynamic> map) {
    return UpcomingModel(
      id: map['id']?.toInt() ?? 0,
      adult: map['adult'] ?? false,
      title: map['title'] ?? '',
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpcomingModel.fromJson(String source) =>
      UpcomingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UpcomingModel(id: $id, adult: $adult, title: $title, voteAverage: $voteAverage, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpcomingModel &&
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
