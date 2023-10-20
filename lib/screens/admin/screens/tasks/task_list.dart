import 'package:adminease/models/tarefas.dart';
import 'package:adminease/screens/admin/screens/tasks/tasks_details.dart';
import 'package:adminease/screens/admin/services/get_employee.dart';
import 'package:adminease/screens/admin/services/get_tasks.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/list_user.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
    static const String routeName = '/tasks-list';

  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Tarefas>? tasList;
  final GetTasks getTasks = GetTasks();

  @override
  void initState() {
    super.initState();
    fetchTasksList();
  }

  fetchTasksList() async {
    tasList = await getTasks.fetchTask(
      context: context,
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          header(context, back: true, title: "Funcionarios", menu: true, settings: true),
            textField(1, hint: "Buscar Funcionarios"),
            
            Expanded(
              
              child: tasList == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: tasList!.length,
                      itemBuilder: (context, index) {
                        final tasks = tasList![index];
                        return listUser(context, onTap: () {
                          Navigator.pushNamed(
                            
                            context,
                            TaskDetails.routeName,
                            arguments: tasks,
                          );
                        },
                        check: false,
                        name: tasks.dataFim,
                        desc: tasks.empresafuncionarioId,
                        salary: true,
                        sal: 1200,

                      img: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
                        );
                      }),
            )
        
        ],
      )),
    );
  }
}