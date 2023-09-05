
import 'package:adminease/screens/login/controllers/log_in_controller.dart';
import 'package:adminease/screens/login/notifier/log_in_notifier.dart';
import 'package:adminease/screens/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogIn extends ConsumerStatefulWidget {
  const LogIn({Key? key}): super(key: key);

  @override
  ConsumerState<LogIn> createState() => _LogInState();
}

class _LogInState extends ConsumerState<LogIn> {
  String email = '';
  String password = '';
  String user = '';
late LogInController _controller;

@override
void initState(){
  _controller = LogInController(ref);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final signInProvider = ref.watch(logInNotifierProvider);
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
              onChanged: (value) => ref.read(logInNotifierProvider.notifier).onUserEmailChange(
    value),

              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => ref.read(logInNotifierProvider.notifier).onUserPasswordChange(
                  value),
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Radio(
                  value: 'Escola',
                  groupValue: signInProvider.select,
                  onChanged: (value) =>
                    ref.read(logInNotifierProvider.notifier).onUserSelectChange(value!),
                ),
                Text('Escola'),
                Radio(
                  value: 'Empresa',
                  groupValue: signInProvider.select,
                  onChanged: (value) => ref.read(logInNotifierProvider.notifier).onUserSelectChange(value!),
                ),
                Text('Empresa'),
              ],
            ),

            ElevatedButton(
              onPressed: () => _controller.handllerLogIn(),
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
             },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
