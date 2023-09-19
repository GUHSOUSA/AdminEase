import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/auth/auth.dart';
import 'package:adminease/screens/home/screens/home_screen.dart';
import 'package:adminease/screens/home/screens/no_escolas.dart';
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
        themeMode: Get.put(MainWrapperController()).theme,
        
      onGenerateRoute: (settings) => generateRoute(settings),
      home: 
      Provider.of<UserProvider>(context).user.token.isNotEmpty ? 
          Provider.of<UserProvider>(context).user.type == "escola" ? 
              MainWrapper()
              : Text("Empresa")
      : const AuthChoice(),
      ),
    );
  }
}
class BottomBarDemo extends StatefulWidget {
  @override
  _BottomBarDemoState createState() => _BottomBarDemoState();
}

class _BottomBarDemoState extends State<BottomBarDemo> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    PageTwo(),
    PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Página 1'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Página 2'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text('Página 3'),
      ),
    );
  }
}