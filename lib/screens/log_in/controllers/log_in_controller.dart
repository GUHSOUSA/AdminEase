import 'package:adminease/screens/log_in/notifier/log_in_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInController{
  WidgetRef ref;

  LogInController(
    this.ref);

  void handllerLogIn(){
    var state = ref.read(logInNotifierProvider);
    String email = state.email;
    String password = state.password;

    print(email);
    print(password);
  }
}