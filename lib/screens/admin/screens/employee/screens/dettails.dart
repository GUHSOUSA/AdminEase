import 'package:adminease/models/employee.dart';
import 'package:adminease/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmployeeDetails extends StatefulWidget {
  static const String routeName = '/product-details';
  final Employee employee;
  const EmployeeDetails({super.key, required this.employee});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          header(context, back: true, title: "Detalhes"),
          
          Center(child: Text(widget.employee.name),),
          Center(child: Text(widget.employee.email),),
          Center(child: Text(widget.employee.id),),
          Center(child: Text(widget.employee.salario),),
          Center(child: Text(widget.employee.contrato),),
          Center(child: Text(widget.employee.cargo),),
        ],
      )),
    );
  }
}