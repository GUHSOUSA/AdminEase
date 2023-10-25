
import 'package:adminease/models/tarefas.dart';
import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/search.dart';
import 'package:adminease/screens/admin/screens/tasks/task_list.dart';
import 'package:adminease/screens/admin/services/get_tasks.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/screens/admin/layout/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTextVisible = false;

  List<Tarefas>? tarefasList;
  final GetTasks getTasks = GetTasks();

  @override
  void initState() {
    super.initState();
    fetchEmployeeList();
  }

  fetchEmployeeList() async {
    tarefasList = await getTasks.fetchTask(
      context: context,
    );
    setState(() {});
  }
    

  @override
  Widget build(BuildContext context) {
   

    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
     
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               header(context, settings: true),
              SizedBox(
                height: 10,
              ),
              search(),

              viewCardDasheboard(
                  context: context,
                  numberFunc: user.funcionarios.length.toString(),
                  numberTarefas: user.tarefas.length.toString(),
                  numberRegistros: "0",
                  numerSales: "0",
                  id: _isTextVisible
                      ? user.id
                      : "********************************",
                  icon: _isTextVisible ? "view" : "eye-off-svgrepo-com",
                  onTap: () {
                    setState(() {
                      _isTextVisible = !_isTextVisible;
                      print(_isTextVisible);
                    });
                  }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
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
                              padding: EdgeInsets.only(left: 15.h, top: 20.h),
                              child: Text(
                                "Minhas tarefas",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
              Container(
                
                child: tarefasList == null
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                          padding: EdgeInsets.only(
                              left: 15.0.h, right: 15.h, bottom: 12.h),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: tarefasList == null ? 0 : (tarefasList!.length > 5 ? 5 : tarefasList?.length),

                            itemBuilder: (context, index) {
                              final tasks = tarefasList![index];
                              return listItemTesk(context,tarefas: tasks, titulo: tasks.titulo, user: tasks.desc, status: tasks.status);
                            },
                          ),
                        ),
              ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

