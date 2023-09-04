import 'package:adminease/screens/sign_up/notifier/register_notifier.dart';
import 'package:adminease/utils/popup_message.dart';
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
    if(state.userName.isEmpty){
      toastInfo("escreva um nome de usuario");
    }

    if(state.password!=state.rePassword){
      toastInfo("Sua senhas nao estao iguais");
    }
  }
}