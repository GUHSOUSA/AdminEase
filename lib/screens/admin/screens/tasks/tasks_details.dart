import 'package:adminease/models/tarefas.dart';
import 'package:adminease/utils/colors.dart';
import 'package:adminease/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class TaskDetails extends StatefulWidget {
  static const String routeName = '/task-details';
  final Tarefas tarefas;
  const TaskDetails({super.key, required this.tarefas});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(context,
                title: "Tarefa detalhes", back: true, settings: true),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.h, right: 15.h, top: 5.h, bottom: 40.h),
              child: SizedBox(
                  width: double.infinity,
                  child: Text("Tarefa: ${widget.tarefas.desc}")),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(IconlyLight.calendar),
                                            SizedBox(width: 5.h,),

                      Text("Data de vencimento:"),
                    ],
                  ),
                  Text(widget.tarefas.dataFim),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.h, right: 15.h, top: 5.h, bottom: 40.h),
              child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(IconlyLight.bookmark),
                      SizedBox(width: 5.h,),
                      Text("Notas: Nenhuma${widget.tarefas.observacoes}"),
                    ],
                  )),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
              width: double.infinity,
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(IconlyLight.user),
                    ],
                  ),
                      Text(widget.tarefas.funcionarioId),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
              width: double.infinity,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
              width: double.infinity,
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(IconlyLight.activity),
                    ],
                  ),
                      Text(widget.tarefas.status),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
              width: double.infinity,
            ),
            
          ],
        ),
      )),
    );
  }
}
