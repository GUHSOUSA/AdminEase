import 'package:adminease/models/employee.dart';
import 'package:adminease/screens/admin/layout/admin/widgets/search.dart';
import 'package:adminease/screens/admin/layout/chat/screen/message.dart';
import 'package:adminease/screens/admin/screens/employee/screens/dettails.dart';
import 'package:adminease/screens/admin/services/get_employee.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/list_user.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Employee>? employeeList;
  final GetEmployee getEmployee = GetEmployee();

  @override
  void initState() {
    super.initState();
    fetchEmployeeList();
  }

  fetchEmployeeList() async {
    employeeList = await getEmployee.fetEmployee(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(child: 
      Column(children: [
        header(context, title: "Chat", settings: true, menu: true),
        textField(1),
          Expanded(
              
              child: employeeList == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: employeeList!.length,
                      itemBuilder: (context, index) {
                        final employee = employeeList![index];
                        return listUser(
                          context, 
                          name: employee.name, 
                          check: true, 
                          desc: employee.cargo, 
                          img: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80", 
                          onTap: (){ Navigator.pushNamed(
                            context,
                            ChatMessage.routeName,
                            arguments: employee,
                          );}, 
                          
                          ); }),
            )
          
      ],)
      );
  }
}