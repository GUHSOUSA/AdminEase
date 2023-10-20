import 'dart:convert';

import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/utils/erro.dart';
import 'package:adminease/utils/uri.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:adminease/navigation/tabs.dart';

class LoginServices {
  bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      print(email);
      print(password);
      if (!isValidEmail(email)) {
        Fluttertoast.showToast(
          msg: "E-mail não é válido",
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return;
      }

      http.Response res = await http.post(
        Uri.parse('$uri/api/auth/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErroHandler(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          print(jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            TabsPage.routeName,
            (route) => false,
          );
          Fluttertoast.showToast(
            msg: 'Login feito com sucesso',
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}