
import 'package:adminease/screens/admin/layout/chat/screen/chat.dart';
import 'package:adminease/screens/admin/layout/home/screens/home_screen.dart';
import 'package:adminease/screens/admin/layout/home/tagsnfc.dart';
import 'package:adminease/screens/admin/services/get_employee.dart';
import 'package:adminease/utils/colors.dart';
import 'package:adminease/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:adminease/screens/admin/layout/admin/screens/admin_screen.dart';

class TabsPage extends StatefulWidget {
  static const String routeName = '/TabsPage';
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ChatScreen(),
    AdminScreen(),
    NfcRead(),
    EventsScreen(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomAppBar(
        
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            _bottomAppBarItem(icon: IconlyLight.home, label: "Home", index: 0, context),
            _bottomAppBarItem(icon: IconlyLight.chat,label: "Chat", index: 1, context),
            _bottomAppBarItem(icon: IconlyLight.password,label: "Admin", index: 2, context),
            _bottomAppBarItem(icon: IconlyLight.profile,label: "Perfil", index: 5, context),
          ],
        ),
      ),
    );
  }

   Widget _bottomAppBarItem(BuildContext context,
      {required icon, required index, required label}) {
    return ZoomTapAnimation(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _currentIndex == index
                  ? AppColors.navyBlue
                  : Colors.grey,
              size: 20,
            ),
              Text(
              label,
              style: TextStyle(
                  color: _currentIndex == index
                      ? AppColors.sapphireBlue
                      : Colors.grey,
                  fontSize: 13,
                  fontWeight: _currentIndex == index
                      ? FontWeight.w600
                      : null),
            ),
         
           ],
        ),
      ),
    );
  }
}


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Text('Search Screen'));
}

class PlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Text('Plus Screen'));
}

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Text('List Screen'));
}
class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Text('Events Screen'));
}
class PersonScreen extends StatefulWidget {
  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {return Scaffold(
    
    body: SafeArea(
      child: ListView(
    
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          children: <Widget>[
            header(context, title: "Perfil"),
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Icon(Icons.mail, color: AppColors.navyBlue),
              title: Text('Alterar Email'),
              onTap: () {
                // Implementar funcionalidade de alteração de email
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: AppColors.navyBlue),
              title: Text('Alterar Senha'),
              onTap: () {
                // Implementar funcionalidade de alteração de senha
              },
            ),
            ListTile(
              leading: Icon(Icons.assessment, color: AppColors.navyBlue),
              title: Text('Ver Relatório'),
              onTap: () {
                // Implementar funcionalidade para visualizar relatório
              },
            ),
            ListTile(
              leading: Icon(Icons.download_rounded, color: AppColors.navyBlue),
              title: Text('Baixar Dados'),
              onTap: () {
                // Implementar funcionalidade de download de dados do usuário
              },
            ),
            SwitchListTile(
              activeColor: AppColors.navyBlue,
              title: Text('Ativar Notificações'),
              secondary: Icon(Icons.notifications, color: AppColors.navyBlue),
              value: true,
              
              onChanged: (bool value) {
                // Implementar lógica para ativar/desativar notificações
              },
              // Reduz o tamanho do switch para 80% do original
            ),
            ListTile(
              
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Sair'),
              onTap: () => GetEmployee().logOut(context),
            ),
          ],
        ),
    ),
    
  );
}
}