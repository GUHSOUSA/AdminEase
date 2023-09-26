import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/auth/auth.dart';
import 'package:adminease/screens/login/services/login_services.dart';
import 'package:adminease/screens/router.dart';
import 'package:adminease/screens/tab/controllers/tab.dart';
import 'package:adminease/screens/tab/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LoginServices loginServices = LoginServices();

  @override
  void initState() {
    super.initState();
    loginServices.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: Get.put(MainWrapperController()).theme,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "escola"
                ? MainWrapper()
                : Text("Empresa")
            : MainWrapper(),
      ),
    );
  }
}
