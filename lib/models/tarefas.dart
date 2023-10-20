import 'dart:convert';

class Tarefas {
  final String titulo;
  final String desc;
  final String dataFim;
  final String status;
  final String observacoes;
  final String empresafuncionarioId;
  final String  funcionarioId;

  Tarefas({

    required this.titulo,
    required this.desc,
    required this.dataFim,
    required this.status,
    required this.observacoes, 
    required this.empresafuncionarioId,
    required this.funcionarioId
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'desc': desc,
      'dataFim': dataFim,
      'status': status,
      'observacoes': observacoes,
      'empresafuncionarioId': empresafuncionarioId,
      'funcionarioId': funcionarioId
    };
  }

  factory Tarefas.fromMap(Map<String, dynamic> map) {
    return Tarefas(
      titulo: map['titulo'] ?? '',
      desc: map['desc'] ?? '',
      dataFim: map['dataFim'] ?? '',
      status: map['status'] ?? '',
      observacoes: map['observacoes'] ?? '',
      empresafuncionarioId: map['empresafuncionarioId'] ?? '',
      funcionarioId: map['_funcionarioId'] ?? '',
      
    );
  }

  String toJson() => json.encode(toMap());

  factory Tarefas.fromJson(String source) =>
      Tarefas.fromMap(json.decode(source));
}
