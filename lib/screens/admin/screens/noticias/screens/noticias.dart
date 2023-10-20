import 'package:adminease/utils/colors.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class AddNoticias extends StatefulWidget {
      static const String routeName = '/add-noticias';

  const AddNoticias({super.key});

  @override
  State<AddNoticias> createState() => _AddNoticiasState();
}

class _AddNoticiasState extends State<AddNoticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context, back: true, title: "Adicionar noticias"),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Task Nome"),
            ),
            textField(1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Text("Descrição"),
            ),
            textField(5),
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
  }
}