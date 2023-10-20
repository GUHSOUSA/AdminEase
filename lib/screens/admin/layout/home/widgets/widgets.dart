import 'package:adminease/models/tarefas.dart';
import 'package:adminease/screens/admin/screens/tasks/tasks_details.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


Widget viewCardDasheboard(
    {
    required BuildContext context,  
    String id = "",
    String icon = "",
    String numberFunc = "",
    String numberTarefas = "",
    String numberRegistros = "",
    String numerSales = "", void Function()? onTap}) {
  return FadeInUp(
    delay: const Duration(milliseconds: 200),
    duration: const Duration(milliseconds: 400),
    child: Padding(
      padding: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 5.h),
      child: Container(
        width: double.infinity, // Você pode ajustar a largura conforme necessário
        height: 250.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardItemdasheboard(
                    category: "funcionarios",
                    context: context,
                    route: "/Funcionarios-list",
                      colorIcon: Color(0xFFE0F7FA),
                      assets: "funcionario",
                      title: "Funcionarios",
                      number: numberFunc),
                  cardItemdasheboard(
                    category: "Tarefas",
                    context: context,
                    route: "/tasks-list",
                      colorIcon: Color(0xFFE8F5E9),
                      assets: "check",
                      title: "Tarefas",
                      number: numberTarefas)
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardItemdasheboard(
                    category: "Registros",
                    context: context,
                    route: "/category-card-list",
                      colorIcon: Color(0xFFE0E0FF),
                      assets: "pending",
                      title: "Registros",
                      number: numberRegistros),
                  cardItemdasheboard(
                    category: "Vendas",
                    context: context,
                    route: "/category-card-list",
                      colorIcon: Color(0xFFFFFFE0),
                      assets: "chart_user",
                      title: "Vendas",
                      number: numerSales)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              adminCardView(rotas: "/api/${id}", onTap: onTap, icon: icon)
            ],
          ),
        ), // Você pode ajustar a altura conforme necessário
      ),
    ),
  );
}

Widget cardItemdasheboard(
    {
      required BuildContext context,
    String title = "",
    String number = "",
    String assets = "",
    required String route,
    required String category,
    Color colorIcon = (Colors.grey)}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route, arguments: category);
    },
    child: FadeInUp(
      delay: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 60.h,
        width: 80.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Row(
                children: [
                  Container(
                      height: 25.h,
                      width: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: colorIcon // ou Colors.blue[50]
                          ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0.h),
                        child: SvgPicture.asset(
                          "assets/${assets}.svg",
                          color: Color.fromARGB(255, 14, 14, 160),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 5.h),
                    child: Text(
                      number,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget adminCardView({String rotas = "", void Function()? onTap, String icon = ""}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 30.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.h),
            color: Color(0xFFFFE0E0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.h),
                child: Text(
                  rotas,
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 67, 67), fontSize: 10.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                child: SvgPicture.asset(
                  "assets/copy.svg",
                  height: 14.w,
                  width: 14.w,
                  color: Color.fromARGB(255, 248, 67, 67),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: 8.h,
      ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 30.h,
          width: 30.h,
          decoration: BoxDecoration(
              color: Color(0xFFFFE0E0), borderRadius: BorderRadius.circular(4.h)),
          child: Padding(
            padding: EdgeInsets.all(5.0.h),
            child: SvgPicture.asset(
              "assets/$icon.svg",
              color: Color.fromARGB(255, 248, 67, 67),
            ),
          ),
        ),
      )
    ],
  );
}

Widget listItemTesk  (BuildContext context, {
  String titulo = "",
  String status = "",
  String user = "",
  Tarefas? tarefas,
}){
  return GestureDetector(
    onTap: () {
       Navigator.pushNamed(context, TaskDetails.routeName, arguments: tarefas);
    },
    child: FadeInUp(
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 300),
      child:  Container(
        margin: EdgeInsets.only(bottom: 13.h),
        height: 50.h,
        
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 254, 255),
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/vertical.svg",
                    width: 14.h,
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: CircleAvatar(
                        backgroundColor: Colors.amberAccent),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user,
                        style: TextStyle(
                            color: Colors.grey, fontSize: 10.sp),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: 20.h,
                width: 80.w,
                decoration: BoxDecoration(
                    color: Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(4.h)),
                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
     
}


class Tarefa {
  final String titulo;
  final String nome;
  final bool concluido;

  Tarefa({
    required this.titulo,
    required this.nome,
    required this.concluido,
  });
}
class SalesData {
  final String month;
  final double salesValue;

  SalesData({required this.month, required this.salesValue});
}

