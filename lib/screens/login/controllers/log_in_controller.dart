import 'package:adminease/screens/login/notifier/log_in_notifier.dart';
import 'package:adminease/screens/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInController{
  WidgetRef ref;

  LogInController(
    this.ref);

  void handllerLogIn(){
    var state = ref.read(logInNotifierProvider);
    String email = state.email;
    String password = state.password;
    String select = state.select;
    print(email);
    print(password);
    print(select);
    
    try{
      var context = Navigator.of(ref.context);
      if(select == "Escola"){
        context.push(
          MaterialPageRoute(
            builder: (BuildContext context) => 
            Scaffold(
          appBar: AppBar(title: Text("login para escola"),),
        )
        )
        );
      }else{
        context.push(
          MaterialPageRoute(
            builder: (BuildContext context) => 
            Scaffold(
          appBar: AppBar(title: Text("login para empres"),),
        )
        )
        );
      }
    }catch(e){
      print(e.toString());
    }
  }
}