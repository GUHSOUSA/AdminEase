class LoginState {
  final String email;
  final String password;
  final String select;

  const LoginState({

    this.email = "",
    this.password = "",
    this.select = "Escola",

  });
  LoginState copyWith({
    String? email, 
    String? password, 
    String? select,
  }){
    return LoginState(
      email: email?? this.email,
      password: password?? this.password,
      select: select?? this.select,

    );
  }
}