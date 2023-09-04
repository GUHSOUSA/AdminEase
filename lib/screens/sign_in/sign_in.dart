import 'package:adminease/screens/log_in/log_in.dart';
import 'package:adminease/screens/sign_in/notifier/register_notifier.dart';
import 'package:adminease/screens/sign_in/sign_in_controller.dart';
import 'package:adminease/screens/sign_in/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  ConsumerState<SignIn> createState() => _SignInState();
}
class _SignInState extends ConsumerState<SignIn>{
  late SignUpController _controller;


  @override
  void initState(){
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("texttvyv"),
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
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) =>
                  ref.read(registerNotifierProvider.notifier).onUserEmailChange(
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
            ),
            ElevatedButton(
              onPressed: () => _controller.handlerSignUo(),
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
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
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
