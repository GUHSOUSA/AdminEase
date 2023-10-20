import 'dart:convert';

import 'package:adminease/models/employee.dart';
import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/auth/auth.dart';
import 'package:adminease/utils/erro.dart';
import 'package:adminease/utils/toast.dart';
import 'package:adminease/utils/uri.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetEmployee {
  Future<List<Employee>> fetEmployee({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Employee> employeeList = [];
    try {
      http.Response res = await http.get(
          Uri.parse(
              '$uri/api/admin/${userProvider.user.referenceId}/funcionarios'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });

      httpErroHandler(
          response: res,
          context: context,
          onSuccess: () {
             for (int i = 0; i < jsonDecode(res.body).length; i++) {
            employeeList.add(
              Employee.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
             }
          });
    } catch (e) {
      toastInfo(context, e.toString());
    }
    return employeeList;
  }
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthChoice.routeName,
        (route) => false,
      );
    } catch (e) {
      toastInfo(context, e.toString());
    }
  }
}
