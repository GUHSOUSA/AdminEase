
import 'package:adminease/screens/admin/screens/admin_screen.dart';
import 'package:adminease/screens/home/screens/home_screen.dart';
import 'package:adminease/screens/home/tagsnfc.dart';
import 'package:adminease/screens/tab/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    AdminScreen(),
    NfcRead(),
    ListScreen(),
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
            _bottomAppBarItem(icon: IconlyLight.wallet,label: "Admin", index: 1, context),
            SizedBox(width: 48), // For the middle '+' button.
            _bottomAppBarItem(icon: IconlyLight.chart,label: "home", index: 3, context),
            _bottomAppBarItem(icon: IconlyLight.profile,label: "home", index: 4, context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () => setState(() => _currentIndex = 2),
        child: Icon(Icons.nfc, color: _currentIndex == 2 ? Colors.white : Colors.grey, size: 26,),
        elevation: 0,
        backgroundColor: Colors.black,
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  ? ColorConstants.appColors
                  : Colors.grey,
              size: 20,
            ),
            Text(
              label,
              style: TextStyle(
                  color: _currentIndex == index
                      ? ColorConstants.appColors
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

class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Text('Person Screen'));
}