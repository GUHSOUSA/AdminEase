import 'package:adminease/screens/sign_up/controllers/sign_in_controller.dart';
import 'package:adminease/screens/sign_up/notifier/register_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}
class _SignUpState extends ConsumerState<SignUp>{
  late SignUpController _controller;


  @override
  void initState(){
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Entrar"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             TextField(
              onChanged: (value) =>
                  ref.read(registerNotifierProvider.notifier).onUserNameChange(
                      value),
              decoration: InputDecoration(
                labelText: 'usuario',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) =>
                  ref.read(registerNotifierProvider.notifier).onUserEmailChange(
                      value),
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) =>
                  ref.read(registerNotifierProvider.notifier).onUserPasswordChange(
                      value),

              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
             TextField(
              onChanged: (value) =>

                  ref.read(registerNotifierProvider.notifier).onUserrePasswordChange(value),

              decoration: InputDecoration(
                labelText: 'repita a senha',
              ),
            ),
            SizedBox(height: 20.0),
            /*Row(
              children: [
                Radio(
                  value: 'Escola',
                  groupValue: "selectedOption",
                  onChanged: (value) {

                  },
                ),
                Text('Escola'),
                Radio(
                  value: 'Empresa',
                  groupValue: "selectedOption",
                  onChanged: (value) {

                  },
                ),
                Text('Empresa'),
              ],
            ),*/
            ElevatedButton(
              onPressed: () => _controller.handlerSignUo(context),
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10,),
            
          ],
        ),
      ),
    );
  }
}
