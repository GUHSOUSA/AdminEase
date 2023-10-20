import 'package:adminease/models/user.dart';
import 'package:adminease/utils/erro.dart';
import 'package:adminease/utils/toast.dart';
import 'package:adminease/utils/uri.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}
class RegisterService {
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      
      if (!isValidEmail(email)) {
       
        toastInfo(context, "O Email não é valido", color: Colors.red);
        return;
      }

      if (password.length < 6) {
        toastInfo(context, "A senha deve ter no minimo 6 letras", color: Colors.red);
        return;
      }

      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        referenceId: '',
        role: '',
        token: '',
        funcionarios: [],
        tarefas: [],
        noticias: [],
        
      );


      http.Response res = await http.post(
        Uri.parse('$uri/api/auth/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErroHandler(
        response: res,
        context: context,
        onSuccess: () {
          toastInfo(context, "Conta criada com sucesso. faça Login", color: Colors.green);
        },
      );
    } catch (e) {
      toastInfo(context, e.toString());
    }
  }
}
