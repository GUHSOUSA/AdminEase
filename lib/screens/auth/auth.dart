import 'package:adminease/screens/login/screens/log_in.dart';
import 'package:adminease/screens/register/screens/sign_up.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthChoice extends StatefulWidget {
  static const String routeName = '/Auth-choice';
  const AuthChoice({super.key});

  @override
  State<AuthChoice> createState() => _AuthChoiceState();
}

class _AuthChoiceState extends State<AuthChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 800),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Image.network(
                    'https://assets-global.website-files.com/5aa16619a722600001c19c3f/5b844da4d67953ca5b0c5c52_Decode.jpg',
                    width: double.infinity,
                    height: 400.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInUp(
                            delay: const Duration(milliseconds: 700),
                            duration: const Duration(milliseconds: 800),
                            child: Text(
                              'Contoler de acesso com NFC',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 900),
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              'controler o acesso de funcionarios e liste tarefas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 1100),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SigInScreen(),
                                  ));
                            },
                            child: FadeInUp(
                                delay: const Duration(milliseconds: 1100),
                                duration: const Duration(milliseconds: 1200),
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(color: Colors.white),
                                )),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Satoshi'),
                                backgroundColor:
                                    Color.fromRGBO(52, 237, 231, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15.w)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1100),
                    duration: const Duration(milliseconds: 1200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ));
                            },
                            child: Text(
                              'Registre-se',
                              style: TextStyle(
                                color: Color.fromRGBO(52, 237, 231, 1),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
