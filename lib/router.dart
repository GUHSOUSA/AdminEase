import 'package:adminease/models/employee.dart';
import 'package:adminease/models/tarefas.dart';
import 'package:adminease/screens/admin/layout/chat/screen/message.dart';
import 'package:adminease/screens/admin/screens/employee/screens/add.dart';
import 'package:adminease/screens/admin/screens/employee/screens/home_list.dart';
import 'package:adminease/screens/admin/screens/employee/screens/dettails.dart';
import 'package:adminease/screens/admin/screens/noticias/screens/noticias.dart';
import 'package:adminease/screens/admin/screens/tasks/add_task.dart';
import 'package:adminease/screens/admin/screens/tasks/task_list.dart';
import 'package:adminease/screens/admin/screens/tasks/tasks_details.dart';
import 'package:adminease/screens/auth/auth.dart';
import 'package:adminease/screens/admin/layout/home/screens/card_details.dart';
import 'package:adminease/screens/admin/layout/home/screens/home_screen.dart';
import 'package:adminease/navigation/tabs.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthChoice.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthChoice(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case EmployeeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EmployeeScreen(),
      );
    case TabsPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TabsPage(),
      );
    case CardList.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CardList(
          category: category,
        ),
      );
    case AddTasks.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddTasks(),
      );
    case AddEmployee.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddEmployee(),
      );
    case AddNoticias.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddNoticias(),
      );
    case EmployeeDetails.routeName:
      var employee = routeSettings.arguments as Employee;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EmployeeDetails(
          employee: employee,
        ),
      );
      case TaskList.routeName:
      
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskList(
          
        ),
      );
      case TaskDetails.routeName:
      var tarefas = routeSettings.arguments as Tarefas;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskDetails(
          tarefas: tarefas,
        ),
      );
    case ChatMessage.routeName:
      var employee = routeSettings.arguments as Employee;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatMessage(
          employee: employee,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
