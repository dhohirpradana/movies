import 'dart:convert';

class NowPlayingModel {
  final int id;
  final bool adult;
  final String title;
  final double voteAverage;
  NowPlayingModel({
    required this.id,
    required this.adult,
    required this.title,
    required this.voteAverage,
  });

  NowPlayingModel copyWith({
    int? id,
    bool? adult,
    String? title,
    double? voteAverage,
  }) {
    return NowPlayingModel(
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

  factory NowPlayingModel.fromMap(Map<String, dynamic> map) {
    return NowPlayingModel(
      id: map['id']?.toInt() ?? 0,
      adult: map['adult'] ?? false,
      title: map['title'] ?? '',
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NowPlayingModel.fromJson(String source) =>
      NowPlayingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NowPlayingModel(id: $id, adult: $adult, title: $title, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NowPlayingModel &&
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
