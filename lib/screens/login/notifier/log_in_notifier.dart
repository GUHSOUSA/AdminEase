import 'package:adminease/screens/login/notifier/log_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'log_in_notifier.g.dart';

@riverpod
class LogInNotifier extends _$LogInNotifier{
  @override
  LoginState build(){
    return LoginState();
  }
  void onUserEmailChange(String email){
    state = state.copyWith(email: email);
  }
  void onUserPasswordChange(String password){
    state = state.copyWith(password: password);
  }
  void onUserSelectChange(String select){
    state = state.copyWith(select: select);
  }
}