import 'dart:convert';

class News {
  final String name;
  final String desc;
  final String empresa;
  final String id;
  News({
    required this.name,
    required this.desc,
    required this.empresa,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'empresa': empresa,
      'id': id,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      empresa: map['empresa'] ?? '',
      id: map['_id'] ?? '',
      
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source));
}
