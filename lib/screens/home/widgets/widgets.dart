import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget appBarHomeScreen({String text = ""}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 200), // tempo ajustado
                duration: const Duration(milliseconds: 400), // tempo ajustado
                child: Text(
                  "Óla!",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300), // tempo ajustado
                duration: const Duration(milliseconds: 400), // tempo ajustado
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 400), // tempo ajustado
          duration: const Duration(milliseconds: 400), // tempo ajustado
          child: Row(
            children: [
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/1827/1827420.png",
                width: 20.w,
                height: 20.w,
              ),
              SizedBox(
                width: 15.h,
              ),
            ],
          ),
        )
      ],
    ),
  );
}


Widget viewCardDasheboard(
    {String id = "",
    String numberFunc = "",
    String numberConcluidas = "",
    String numberPending = "",
    String numberMedia = ""}) {
  return FadeInUp(
    delay: const Duration(milliseconds: 200),
    duration: const Duration(milliseconds: 400),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity, // Você pode ajustar a largura conforme necessário
        height: 250.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.w), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardItemdasheboard(
                      colorIcon: Color(0xFFE0F7FA),
                      assets: "funcionario",
                      title: "Funcionarios",
                      number: numberFunc),
                  cardItemdasheboard(
                      colorIcon: Color(0xFFE8F5E9),
                      assets: "check",
                      title: "Concluidas",
                      number: numberConcluidas)
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardItemdasheboard(
                      colorIcon: Color(0xFFE0E0FF),
                      assets: "pending",
                      title: "Pendente",
                      number: numberPending),
                  cardItemdasheboard(
                      colorIcon: Color(0xFFFFFFE0),
                      assets: "relogio",
                      title: "Media",
                      number: numberMedia)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              adminCardView(rotas: "/api/${id}")
            ],
          ),
        ), // Você pode ajustar a altura conforme necessário
      ),
    ),
  );
}

Widget cardItemdasheboard(
    {String title = "",
    String number = "",
    String assets = "",
    Color colorIcon = (Colors.grey)}) {
  return FadeInUp(
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
  );
}

Widget adminCardView({String rotas = ""}) {
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
                      color: Color.fromARGB(255, 248, 67, 67), fontSize: 11.sp),
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
      Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
            color: Color(0xFFFFE0E0), borderRadius: BorderRadius.circular(4.h)),
        child: Padding(
          padding: EdgeInsets.all(5.0.h),
          child: SvgPicture.asset(
            "assets/view.svg",
            color: Color.fromARGB(255, 248, 67, 67),
          ),
        ),
      )
    ],
  );
}


Widget listItemTesk (Tarefa tarefa){
  return FadeInUp(
    delay: const Duration(milliseconds: 100),
    duration: const Duration(milliseconds: 300),
    child:  Container(
      margin: EdgeInsets.only(bottom: 13.h),
      height: 50.h,
      
      decoration: BoxDecoration(
        color: Color(0xFFF0F8FF),
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
                      tarefa.titulo,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tarefa.nome,
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
                  color: tarefa.concluido ? Color(0xFFE8F5E9) : Color(0xFFE0E0FF),
                  borderRadius: BorderRadius.circular(4.h)),
              child: Center(
                child: Text(
                  tarefa.concluido ? "Concluido" : "Pendente",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
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
