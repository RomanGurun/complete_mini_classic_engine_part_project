// user_model.dart
// Dart data model for the user JSON you provided.

import 'dart:convert';

class UserModel {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;
  final DateTime creationAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      role: map['role'] as String,
      avatar: map['avatar'] as String,
      creationAt: DateTime.parse(map['creationAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'role': role,
      'avatar': avatar,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'UserModel(id: $id, email: $email, role: $role)';
}

// Helper to parse a JSON array of users
List<UserModel> usersFromJsonArray(String jsonArray) {
  final List<dynamic> decoded = json.decode(jsonArray) as List<dynamic>;
  return decoded.map((e) => UserModel.fromMap(e as Map<String, dynamic>)).toList();
}

// Example usage:
// final jsonString = '[{...}, {...}]';
// final users = usersFromJsonArray(jsonString);
// print(users[0].email);