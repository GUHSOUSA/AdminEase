import 'package:adminease/screens/admin/screens/employee/services/add_employee.dart';
import 'package:adminease/screens/admin/screens/tasks/widget/toggle.dart';
import 'package:adminease/utils/colors.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployee extends StatefulWidget {
    static const String routeName = '/add-employee';

  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
    final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();
  final TextEditingController cargo = TextEditingController();
  final TextEditingController contrato = TextEditingController();
  final TextEditingController salario = TextEditingController();
  final AdminServices adminServices = AdminServices();
  
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    cargo.dispose();
    contrato.dispose();
    salario.dispose();
    name.dispose();
  }
   void sellProduct() {
    
      adminServices.adicionarEmployee(
        context: context,
        name: name.text,
        email: email.text,
        contrato: contrato.text,
        salario: salario.text,
        cargo: cargo.text,
      );
    
  }
  
  bool isOptionASelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      SafeArea(
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            header(context, title: "Adicionar Funcionario", back: true),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Nome"),
            ),
            textField(1,controller: name, hint: "Nome", ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Email funcionario"),
            ),
            textField(1,controller: email, hint: "Email", ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Cargo"),
            ),
            textField(1,controller: cargo, hint: "Cargo"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Contrato"),
            ),
            textField(1,controller: contrato, hint: "CLT / MEI / CNPJ"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Salario"),
            ),
            textField(1,controller: salario, hint: "R\$1000"),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Admin"),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomOption(
                    label: 'Sim',
                    isSelected: isOptionASelected,
                    onTap: () {
                      setState(() {
                        isOptionASelected = true;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  CustomOption(
                    label: 'Não',
                    isSelected: !isOptionASelected,
                    
                    onTap: () {
                      setState(() {
                        
                        isOptionASelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Resumo"),
            ),
            textField(5, hint: "Resumo", ),
            
          ])
        ),
      ),
      bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(15.0),
    child: GestureDetector(
      
      onTap: () =>
        sellProduct(),
        // Add your action for the button h
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.navyBlue
        ),
        child: Center(child: Text("Adicionar", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13.sp
        ),))),
    ),
      )
      );
  }
}