import 'package:adminease/escolas/constants/error_handler.dart';
import 'package:adminease/escolas/constants/global_variables.dart';
import 'package:adminease/escolas/constants/utils.dart';
import 'package:adminease/escolas/models/escola.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpEscola(
      {required BuildContext context,
      required String email,
      required String password,
      required String escola}) async {
    try {
      Escola escolas = Escola(
          id: "",
          escola: escola,
          password: password,
          token: "",
          slug: "",
          email: email);
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.108:4000/api/escola/register'),
        body: escolas.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

      );
      httpErroHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              "Conta criada com sucesso!!",
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
