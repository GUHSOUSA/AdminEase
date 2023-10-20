import 'dart:convert';

class Employee {
  final String name;
  final String cargo;
  final String contrato;
  final String salario;
  final String email;
  final String admin;
  final String  id;

  Employee({

    required this.name,
    required this.cargo,
    required this.contrato,
    required this.salario,
    required this.email, 
    required this.admin,
    required this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cargo': cargo,
      'contrato': contrato,
      'salario': salario,
      'email': email,
      'admin': admin,
      'id': id
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      name: map['name'] ?? '',
      cargo: map['cargo'] ?? '',
      contrato: map['contrato'] ?? '',
      salario: map['_salario'] ?? '',
      email: map['email'] ?? '',
      admin: map['admin'] ?? '',
      id: map['_id'] ?? '',
      
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));
}
