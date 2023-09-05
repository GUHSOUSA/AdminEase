import 'dart:convert';
import 'package:adminease/screens/register/notifier/register_notifier.dart';
import 'package:adminease/common/utils/popup_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../common/utils/error_handler.dart';
import '../../../common/utils/utils.dart';

class SignUpController{
  final WidgetRef ref;
  SignUpController({required this.ref});
  Future<void> handlerSignUo(BuildContext context) async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    print(name);
    print(email);
    print(password);
    print(rePassword);
    if(state.userName.isEmpty){
      toastInfo("escreva um nome de usuario");
    }

    if(state.password!=state.rePassword){
      toastInfo("Sua senhas nao estao iguais");
    }
    try{

      Map<String, dynamic> requestData = {
        'name': name,
        'email': email,
        'password': password,
      };

      // Converter o mapa em JSON
      String requestBody = jsonEncode(requestData);
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.106:4000/api/user/register'),
        body: requestBody,
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
    }catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}