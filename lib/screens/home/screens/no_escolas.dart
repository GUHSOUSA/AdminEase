import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/login/screens/log_in.dart';
import 'package:adminease/screens/register/screens/sign_up.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NoEscolaFound extends StatefulWidget {
  static const String routeName = '/Auth-choice';
  const NoEscolaFound({super.key});

  @override
  State<NoEscolaFound> createState() => _NoEscolaFoundState();
}

class _NoEscolaFoundState extends State<NoEscolaFound> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://static.vecteezy.com/ti/vetor-gratis/p3/10435932-nfc-reader-app-icon-rfid-access-control-ui-ux-user-interface-nfc-button-and-hand-sticker-near-field-communication-rfid-elevator-controller-web-or-mobile-ilustracaoial-isolada-do-aplicativo-vetor.jpg',
                    width: double.infinity,
                    height: 400.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
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
                              'Comece Adicionando uma empresa ou escola',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 80.h,
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
                                  builder: (context) => SigInScreen(),
                                ),
                              );
                            },
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 1100),
                              duration: const Duration(milliseconds: 1200),
                              child: Icon(Icons.add, color: Colors.white, size: 30.sp,),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Satoshi',
                              ),
                              backgroundColor: Color.fromRGBO(52, 237, 231, 1),
                              shape:
                                  CircleBorder(), // Define o botão como redondo
                              padding: EdgeInsets.all(
                                  15.w), // Ajuste o tamanho do botão conforme necessário
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
