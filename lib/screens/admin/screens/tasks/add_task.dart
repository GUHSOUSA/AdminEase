import 'package:adminease/screens/admin/screens/tasks/widget/toggle.dart';
import 'package:adminease/utils/colors.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class AddTasks extends StatefulWidget {
  static const String routeName = '/tasks-detailss';

  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            header(context, back: true, title: "Adicionar tarefas"),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Titulo da tarefa"),
            ),
            textField(1, hint: "EX: lavar louça"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Descrição"),
            ),
            textField(5, hint: "EX: Lavar todas as louças"),
            SizedBox(height: 10.h,),
            
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 1.h),
              child: Text("Atribuir funcionario", style: TextStyle(fontSize: 15, color: Colors.black),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 1.h),
              child: Text("Add funcionarios que iram fazer essa task", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Container(height: 30,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 238, 244, 255),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(IconlyLight.user, size: 17,),
                  ),
                  Text("Atribuir"),
                  Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 1.h),
              child: Text("Termina em:", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
              ])  ),
              ),
           
             SizedBox(
                height: 20,
              ),
            ],
          
            
          
        ),
        ),
        ),
        bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(15.0),
    child: GestureDetector(
      
      onTap: () {},
        
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
    ));
  }}