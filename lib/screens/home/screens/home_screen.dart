import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tarefa> tarefas = [
    Tarefa(titulo: 'Lavar a louça', nome: 'Gustavo', concluido: true),
    Tarefa(titulo: 'Estudar Flutter', nome: 'Maria', concluido: false),
    Tarefa(titulo: 'Estudar kotlin', nome: 'samira', concluido: true),
    Tarefa(titulo: 'Estudar java', nome: 'joao', concluido: false),
    Tarefa(titulo: 'Estudar agua', nome: 'pedro', concluido: true),
    // Adicione mais tarefas conforme necessário
  ];
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarHomeScreen(text: user.name
              ),
              viewCardDasheboard(
                  numberFunc: user.funcionarios.length.toString(),
                  numberConcluidas: "45",
                  numberPending: "7",
                  numberMedia: "12:08",
                  id: user.id),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.w),
                      topRight: Radius.circular(20.w),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.h),
                            child: Text(
                              "Minhas tarefas",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                            child: Container(
                              height: 25.h,
                              width: 90.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5.h),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      "Nova tarefa",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/plus.svg",
                                    width: 13.h,
                                    height: 13.h,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0.h, right: 15.h, bottom: 12.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tarefas.length,
                        itemBuilder: (context, index) {
                          final tarefa = tarefas[index];
                          return listItemTesk(tarefa);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
