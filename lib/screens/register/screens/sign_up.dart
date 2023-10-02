import 'package:adminease/common/widgets/text_widget.dart';
import 'package:adminease/screens/login/widget/widgets.dart';
import 'package:adminease/screens/register/services/register_services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}
class _SignUpState extends ConsumerState<SignUp>{
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
  var focusNodeName = FocusNode();
  var focusNodeEmail = FocusNode();
  var focusNodePassword = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool isFocusedName = false;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeName.addListener(() {
      setState(() {
        isFocusedName = focusNodeName.hasFocus;
      });
    });
    focusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = focusNodeEmail.hasFocus;
      });
    });
    focusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = focusNodePassword.hasFocus;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      appBar: buildAppBar("Registra-se"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: 620.h,
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  FadeInDown(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(milliseconds: 1000),
                    child: thirdPartyLogin(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  
                  FadeInDown(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 900),
                          child: Center(child: text16Normal(text: "Ou Registre-se com email")),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                  SizedBox(
                    height: 27.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 750),
                    duration: const Duration(milliseconds: 850),
                    child: const Text(
                      'Nome',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 650),
                    duration: const Duration(milliseconds: 750),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          color:
                              isFocusedName ? Colors.white : Color(0xFFF1F0F5),
                          border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedName)
                              BoxShadow(
                                  color: Color(0xFF835DF1).withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0
                                  // Glow Color
                                  )
                          ]),
                      child: TextField(
                        controller: _nameController,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Seu Nome'),
                        focusNode: focusNodeName,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  
                  FadeInDown(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          color:
                              isFocusedEmail ? Colors.white : Color(0xFFF1F0F5),
                          border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedEmail)
                              BoxShadow(
                                  color: Color(0xFF835DF1).withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0
                                  // Glow Color
                                  )
                          ]),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Seu Email'),
                        focusNode: focusNodeEmail,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 600),
                    child: const Text(
                      'Senha',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          color: isFocusedPassword
                              ? Colors.white
                              : Color(0xFFF1F0F5),
                          border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFocusedPassword)
                              BoxShadow(
                                  color: Color(0xFF835DF1).withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0
                                  // Glow Color
                                  )
                          ]),
                      child: TextField(
                        controller: _passwordController,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                              size: 16.sp,
                            ),
                            border: InputBorder.none,
                            hintText: 'Sua Senha'),
                        focusNode: focusNodePassword,
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 100.h,
                  )),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 700),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => signUpUser(),
                            child: FadeInUp(
                                delay: const Duration(milliseconds: 700),
                                duration: const Duration(milliseconds: 800),
                                child: Text('Registrar-se', style: TextStyle(color: Colors.white),)),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Satoshi'),
                                backgroundColor: Color.fromRGBO(52, 237, 231, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

