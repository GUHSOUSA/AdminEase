import 'package:adminease/screens/sign_in/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  String selectedOption = 'Escola';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
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
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                    });
                  },
                ),
                Text('Escola'),
                Radio(
                  value: 'Empresa',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                    });
                  },
                ),
                Text('Empresa'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print('Email: $email');
                print('Senha: $password');
                print('Opção: $selectedOption');
                if(selectedOption == "Escola"){
                  Navigator.pushNamed(context, "/Escola");
                }else{
                  Navigator.pushNamed(context, "/Empresa");
                }
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
