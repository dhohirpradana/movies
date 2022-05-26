import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final int id;
  final Map avatar;
  final String username;
  final String name;
  User({
    required this.id,
    required this.avatar,
    required this.username,
    required this.name,
  });

  User copyWith({
    int? id,
    Map? avatar,
    String? username,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatar': avatar,
      'username': username,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      avatar: Map.from(map['avatar']),
      username: map['username'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, avatar: $avatar, username: $username, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        mapEquals(other.avatar, avatar) &&
        other.username == username &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ avatar.hashCode ^ username.hashCode ^ name.hashCode;
  }
}
