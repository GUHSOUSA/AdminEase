import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String referenceId;
  final String role;
  final String token;
  final List<String> funcionarios;
  final List<String> tarefas;
  final List<String> noticias; // Alterado para List<String>

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.referenceId,
    required this.role,
    required this.token,
    required this.funcionarios,
    required this.tarefas,
    required this.noticias // Alterado para List<String>
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'referenceId': referenceId,
      'role': role,
      'token': token,
      'funcionarios': funcionarios,
      'tarefas': tarefas,
      'noticias': noticias // Alterado para List<String>
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      referenceId: map['referenceId'] ?? '',
      role: map['role'] ?? '',
      token: map['token'] ?? '',
      funcionarios: List<String>.from(map['funcionarios'] ?? []), // Alterado para List<String>
      tarefas: List<String>.from(map['tarefas'] ?? []), // Alterado para List<String>
      noticias: List<String>.from(map['noticias'] ?? []), // Alterado para List<String>
   
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? referenceId,
    String? role,
    String? token,
    List<String>? funcionarios,
    List<String>? tarefas,
    List<String>? noticias,
    
     // Alterado para List<String>
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      referenceId: referenceId ?? this.referenceId,
      role: role ?? this.role,
      token: token ?? this.token,
      funcionarios: funcionarios ?? this.funcionarios,
      tarefas: tarefas ?? this.tarefas,
      noticias: noticias ?? this.noticias, // Alterado para List<String>
    );
  }
}
