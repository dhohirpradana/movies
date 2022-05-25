import 'dart:convert';

class OnTheAirTV {
  final int id;
  final String name;
  final double voteAverage;
  final String posterPath;
  OnTheAirTV({
    required this.id,
    required this.name,
    required this.voteAverage,
    required this.posterPath,
  });

  OnTheAirTV copyWith({
    int? id,
    String? name,
    double? voteAverage,
    String? posterPath,
  }) {
    return OnTheAirTV(
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

  factory OnTheAirTV.fromMap(Map<String, dynamic> map) {
    return OnTheAirTV(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OnTheAirTV.fromJson(String source) =>
      OnTheAirTV.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OnTheAirTV(id: $id, name: $name, voteAverage: $voteAverage, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnTheAirTV &&
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
