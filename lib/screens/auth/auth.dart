import 'package:adminease/screens/auth/login/screens/log_in.dart';
import 'package:adminease/screens/auth/register/screens/sign_up.dart';
import 'package:adminease/utils/colors.dart';
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
            margin: EdgeInsets.only(top: 10.h),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.asset(
                  'assets/banner3.jpeg',
                  width: double.infinity,
                  height: 300.h,
                  
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
                  Padding(
                    
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Controler de acesso com NFC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    textDirection: TextDirection.rtl,),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 180.h,
                      width: double.infinity,
                      child: Text(
                      'atribuir tarefas e visualizar o desempenho através de gráficos intuitivos.',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w400),
                                      ),
                    ),),
                
            
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                      
                      child: Text(
                        'Faça Login!',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Satoshi'),
                          backgroundColor:
                              AppColors.navyBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.h),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.w)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
           
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                  },
                  child: Text(
                    'Não tenho uma conta',
                    style: TextStyle(
            
                      color: AppColors.navyBlue,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
