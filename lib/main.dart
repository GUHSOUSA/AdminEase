import 'package:adminease/screens/test/empresa.dart';
import 'package:adminease/screens/test/escola.dart';
import 'package:adminease/screens/sign_in/sign_in.dart';
import 'package:adminease/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: "/",
              routes: {
                "/": (context) => Welcome(),
                "/singIn": (context) => SignIn(),
                "/Escola": (context) => const Escola(),
                "/Empresa": (context) => const Empresa()
              },
            ));
  }
}
