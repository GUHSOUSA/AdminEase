import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/router.dart';
import 'package:adminease/navigation/tabs.dart';
import 'package:adminease/services/get_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:adminease/screens/auth/auth.dart';

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
  final GetUserData getUser = GetUserData();
  late Future<void> userDataFuture; // Adicione esta linha

  @override
  void initState() {
    super.initState();
    userDataFuture = getUser.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: FutureBuilder(
          // Supondo que getUserData retorna um Future.
          future: userDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingScreen(); // Tela de Carregamento
            } else if (snapshot.hasError) {
              return ErrorScreen(); // Tela de Erro
            } else {
              // Se o Future está completo e nenhum erro ocorreu, renderiza a tela principal
              final user = Provider.of<UserProvider>(context, listen: false).user; // Modifique esta linha
              return user.token.isNotEmpty ? TabsPage() : const AuthChoice();
            }
          },
        ),
      ),
    );
  }
}

// Widget para a tela de carregamento
class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// Widget para a tela de erro
class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Erro ao carregar dados!'),
      ),
    );
  }
}
