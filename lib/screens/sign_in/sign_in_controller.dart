import 'package:adminease/screens/sign_in/notifier/register_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController{
  final WidgetRef ref;
  SignUpController({required this.ref});
  void handlerSignUo(){
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    print(name);
    print(email);
    print(password);
    print(rePassword);

    if(state.password!=state.rePassword){
      print("ihusl meu bom");
    }
  }
}