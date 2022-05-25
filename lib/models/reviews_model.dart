import 'dart:convert';

import 'package:flutter/foundation.dart';

class Reviews {
  final String id;
  final String author;
  final String content;
  final String updatedAt;
  final Map authorDetails;
  Reviews({
    required this.id,
    required this.author,
    required this.content,
    required this.updatedAt,
    required this.authorDetails,
  });

  Reviews copyWith({
    String? id,
    String? author,
    String? content,
    String? updatedAt,
    Map? authorDetails,
  }) {
    return Reviews(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
      authorDetails: authorDetails ?? this.authorDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'updatedAt': updatedAt,
      'authorDetails': authorDetails,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      id: map['id'] ?? '',
      author: map['author'] ?? '',
      content: map['content'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      authorDetails: Map.from(map['author_details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reviews(id: $id, author: $author, content: $content, updatedAt: $updatedAt, authorDetails: $authorDetails)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reviews &&
        other.id == id &&
        other.author == author &&
        other.content == content &&
        other.updatedAt == updatedAt &&
        mapEquals(other.authorDetails, authorDetails);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        author.hashCode ^
        content.hashCode ^
        updatedAt.hashCode ^
        authorDetails.hashCode;
  }
}
