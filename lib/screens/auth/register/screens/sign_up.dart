import 'package:adminease/screens/auth/login/widget/widgets.dart';
import 'package:adminease/screens/auth/register/services/register_services.dart';
import 'package:adminease/utils/colors.dart';
import 'package:adminease/widgets/header.dart';
import 'package:adminease/widgets/text_field.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final RegisterService registerService = RegisterService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    registerService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        header(context, title: "Boas-vindas!", back: true),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "AdminEase",
                    style: GoogleFonts.aBeeZee(
                        color: AppColors.navyBlue,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                    child: Text("Nome da empresa"),
                  ),
                  textField(
                    1,
                    controller: _nameController,
                    hint: "Ex: Adidas",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                    child: Text("Email"),
                  ),
                  textField(
                    1,
                    controller: _emailController,
                    hint: "Email",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                    child: Text("Senha"),
                  ),
                  textField(
                    1,
                    controller: _passwordController,
                    hint: "Senha",
                  ),
                  SizedBox(
                    height: 250.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => signUpUser(),
                            child: Text(
                              'Fazer cadastro',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Satoshi'),
                                backgroundColor: AppColors.navyBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.w)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
