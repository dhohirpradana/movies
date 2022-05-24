import 'dart:convert';

class Popular {
  final int id;
  final bool adult;
  final String title;
  final double voteAverage;
  Popular({
    required this.id,
    required this.adult,
    required this.title,
    required this.voteAverage,
  });

  Popular copyWith({
    int? id,
    bool? adult,
    String? title,
    double? voteAverage,
  }) {
    return Popular(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'adult': adult,
      'title': title,
      'voteAverage': voteAverage,
    };
  }

  factory Popular.fromMap(Map<String, dynamic> map) {
    return Popular(
      id: map['id']?.toInt() ?? 0,
      adult: map['adult'] ?? false,
      title: map['title'] ?? '',
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Popular.fromJson(String source) =>
      Popular.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Popular(id: $id, adult: $adult, title: $title, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Popular &&
        other.id == id &&
        other.adult == adult &&
        other.title == title &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return id.hashCode ^ adult.hashCode ^ title.hashCode ^ voteAverage.hashCode;
  }
}