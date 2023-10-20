import 'package:adminease/models/employee.dart';
import 'package:adminease/screens/admin/screens/employee/screens/add.dart';
import 'package:adminease/screens/admin/screens/employee/screens/dettails.dart';
import 'package:adminease/screens/admin/screens/noticias/screens/noticias.dart';
import 'package:adminease/screens/admin/screens/tasks/add_task.dart';
import 'package:adminease/screens/admin/services/get_employee.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/notificacoes.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/retangular.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/rounded.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/search.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/sheets.dart';
import 'package:adminease/widgets/list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminScreen extends StatefulWidget {
    

  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Employee>? employeeList;
  final GetEmployee getEmployee = GetEmployee();

  @override
  void initState() {
    super.initState();
    fetchEmployeeList();
  }

  fetchEmployeeList() async {
    employeeList = await getEmployee.fetEmployee(
      context: context,
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final List<String> newsList = [
      'Notícia 1: ',
      'Notícia 2:',
      'Notícia 3: ',
      // Adicione mais notícias conforme necessário
    ];
final List<Funcionario> funcionarios = [
    Funcionario(
      nome: 'João Silva',
      cargo: 'Desenvolvedor',
      salario: 5000.0,
      fotoUrl: 'https://exemplo.com/imagem1.png',
    ),
    Funcionario(
      nome: 'Maria Oliveira',
      cargo: 'Designer',
      salario: 4000.0,
      fotoUrl: 'https://exemplo.com/imagem2.png',
    ),
    // ... Adicione mais funcionários conforme necessário
  ];
    return SafeArea(
      
        child: SingleChildScrollView(
          child: Column(
        children: [
          header(context, menu: true, title: "Administração"),
          search(),
          rounded(
            onEmplyee: (){
              Navigator.pushNamed(context, AddEmployee.routeName);
            },
            onMore: () {
            modalSheetsWidget(context);
          },onTask: (){
             Navigator.pushNamed(context, AddTasks.routeName,);
          },
          onNoticias: (){
            Navigator.pushNamed(context, AddNoticias.routeName);
          }
          ),
          SizedBox(
            height: 20,
          ),
          
         
        ],
          ),
        ),
      );
  }
}
class Funcionario {
  final String nome;
  final String cargo;
  final double salario;
  final String fotoUrl;

  Funcionario({
    required this.nome,
    required this.cargo,
    required this.salario,
    required this.fotoUrl,
  });
}

