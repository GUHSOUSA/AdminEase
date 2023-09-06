import 'package:adminease/screens/register/notifier/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class registerNotifier extends _$registerNotifier{
   @override
   RegisterState build(){
    return RegisterState();
   }
   void onUserNameChange(String name){
     state = state.copyWith(userName: name);
   }
   void onUserEmailChange(String email){
     state = state.copyWith(email: email);
   }
   void onUserPasswordChange(String password){
     state = state.copyWith(password: password);
   }
   void onUserrePasswordChange(String rePassword){
     state = state.copyWith(rePassword: rePassword);
   }
}