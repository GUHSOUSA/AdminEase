import 'dart:convert';

class Escola {
  final String id;
  final String escola;
  final String password;
  final String token;
  final String slug;
  final String email;

  Escola({
    required this.id,
    required this.escola,
    required this.password,
    required this.token,
    required this.slug,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'escola': escola,
      'password': password,
      'token': token,
      'slug': slug,
      'email': email,
    };
  }

  factory Escola.fromMap(Map<String, dynamic> map) {
    return Escola(
      id: map['id'] ?? '',
      escola: map['escola'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      slug: map['slug'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Escola.fromJson(String source) => Escola.fromMap(json.decode(source));
}

