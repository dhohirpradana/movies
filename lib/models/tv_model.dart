import 'dart:convert';

class TV {
  final int id;
  final String name;
  final double voteAverage;
  final String posterPath;
  TV({
    required this.id,
    required this.name,
    required this.voteAverage,
    required this.posterPath,
  });

  TV copyWith({
    int? id,
    String? name,
    double? voteAverage,
    String? posterPath,
  }) {
    return TV(
      id: id ?? this.id,
      name: name ?? this.name,
      voteAverage: voteAverage ?? this.voteAverage,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
    };
  }

  factory TV.fromMap(Map<String, dynamic> map) {
    return TV(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TV.fromJson(String source) => TV.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TV(id: $id, name: $name, voteAverage: $voteAverage, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TV &&
        other.id == id &&
        other.name == name &&
        other.voteAverage == voteAverage &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        voteAverage.hashCode ^
        posterPath.hashCode;
  }
}
