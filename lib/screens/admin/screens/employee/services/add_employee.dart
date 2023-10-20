
import 'dart:io';

import 'package:adminease/models/employee.dart';
import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/utils/erro.dart';
import 'package:adminease/utils/toast.dart';
import 'package:adminease/utils/uri.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void adicionarEmployee({
    required BuildContext context,
    
    required String cargo,
    required String contrato,
    required String salario,
    required String email,
    required String admin,
    required String name,
   
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      

      Employee employee = Employee(
        name: name,
        cargo: cargo,
        contrato: contrato,
        salario: salario,
        email: email,
        admin: admin,
        id: ''
        
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/admin/${userProvider.user.referenceId}/funcionarios/create'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: employee.toJson(),
      );

      httpErroHandler(
        response: res,
        context: context,
        onSuccess: () {
          print("sucesso");
          toastInfo(context, 'Funcionario cadastrado!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      toastInfo(context, e.toString());
    }
  }
}