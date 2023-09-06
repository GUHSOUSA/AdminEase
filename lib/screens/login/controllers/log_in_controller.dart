import 'dart:convert';

import 'package:adminease/common/utils/error_handler.dart';
import 'package:adminease/common/utils/utils.dart';
import 'package:adminease/screens/login/notifier/log_in_notifier.dart';
import 'package:adminease/screens/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInController{
  WidgetRef ref;


  LogInController(
    this.ref);

  Future<void> handllerLogIn(BuildContext context) async {
    var state = ref.read(logInNotifierProvider);
    String email = state.email;
    String password = state.password;
    String select = state.select;
    try{
      Map<String, dynamic> requestData = {
        'email': email,
        'password': password,
      };
      String requestBody = jsonEncode(requestData);
      var navigator = Navigator.of(ref.context);
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.106:4000/api/user/login'),
        body: requestBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

      );
      httpErroHandler(
          response: res,
          context: context,
          onSuccess:  () async{
            
            SharedPreferences prefs = await SharedPreferences.getInstance();
             await  prefs.setString('x-auto-token', jsonDecode(res.body)['token']);
            if(select == "Escola"){
        navigator.push(
          MaterialPageRoute(
            builder: (BuildContext context) => 
            Scaffold(
          appBar: AppBar(title: const Text("login para escola"),),
        )
        )
        );
      }else{
        navigator.push(
          MaterialPageRoute(
            builder: (BuildContext context) => 
            Scaffold(
          appBar: AppBar(title: const Text("login para empres"),),
        )
        )
        );
      }
          });
    }catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
      /*
    }catch(e){
      print(e.toString());
    }
  }
}*/
    