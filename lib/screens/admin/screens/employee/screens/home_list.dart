import 'package:adminease/models/employee.dart';
import 'package:adminease/screens/admin/screens/employee/screens/dettails.dart';
import 'package:adminease/screens/admin/services/get_employee.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/list_user.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmployeeScreen extends StatefulWidget {
  static const String routeName = '/Funcionarios-list';

  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(context, back: true, title: "Funcionarios", menu: true, settings: true),
            textField(1, hint: "Buscar Funcionarios"),
            
            Expanded(
              
              child: employeeList == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: employeeList!.length,
                      itemBuilder: (context, index) {
                        final employee = employeeList![index];
                        return listUser(context, onTap: () {
                          Navigator.pushNamed(
                            context,
                            EmployeeDetails.routeName,
                            arguments: employee,
                          );
                        },
                        check: false,
                        name: employee.name,
                        desc: employee.cargo,
                        salary: true,
                        sal: 1200,

                      img: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
