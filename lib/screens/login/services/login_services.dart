import 'dart:convert';
import 'dart:io';

import 'package:adminease/common/utils/error_handler.dart';
import 'package:adminease/common/utils/global_variables.dart';
import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            HomeScreen.routeName,
            (route) => false,
          );
          Fluttertoast.showToast(
            msg: 'Conectado',
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

  Future<void> getUserData(BuildContext context) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('x-auth-token');
    print(token);
    if (token == null) {
      prefs.setString('x-auth-token', '');
      return;
      print("Sem token");
    }


    var tokenRes = await http.post(
      Uri.parse('$uri/api/auth/tokenIsValid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      },
    );
    print("token valido");

    var response = jsonDecode(tokenRes.body);

    if (response == true) {
      http.Response userRes = await http.get(
        Uri.parse('$uri/api/auth/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
    
      print(userRes.body);

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userRes.body);
    }
    } on SocketException catch (e) {
  print('Erro de rede: $e');
} on http.ClientException catch (e) {
  print('Erro ao fazer requisição: $e');
} catch (e) {
  print('Erro desconhecido: $e');
} catch (e) {
    Fluttertoast.showToast(
      msg: e.toString(),
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
    // Lançando erro para ser capturado pelo FutureBuilder
    throw Exception('Erro ao obter dados do usuário: $e');
  }
}
}