import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/database/screens/database.dart';
import 'package:adminease/screens/login/services/login_services.dart';
import 'package:adminease/screens/router.dart';
import 'package:adminease/screens/tab/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "escola"
                ? TabsPage()
                : Text("Empresa")
            : DatabaseScreen(),
      ),
    );
  }
}