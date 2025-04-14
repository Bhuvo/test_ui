import 'package:demo/home/home_page.dart';
import 'package:demo/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widget/info_widget.dart';
import 'drawer_widget.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int index = 0 ;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(icon : Image.asset('assets/search.png'),onPressed: (){
            },),
            Space(10),
            IconButton(icon : Image.asset('assets/bell.png'),onPressed: (){
            },),
            Space(10),
            IconButton(icon : Image.asset('assets/menu.png'),onPressed: (){
              scaffoldKey.currentState!.openEndDrawer();
            },),
          ],
          title: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.purple,
            child: Text('S'),
          ),
          automaticallyImplyLeading: false,
      
        ),
        endDrawer: AdminSidebar(),
        body: Padding(padding: const EdgeInsets.all(10),
        child: switchScreen(index),),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          fixedColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: index,
          onTap: (val){
            setState(() {
              index = val;
            });
          },
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: 'Program'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'User'),
          BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2), label: 'Request'),
        ],
        ),
      ),
    );
  }
  switchScreen(int index){
    switch(index){
      case 0:
        return HomePage();
      case 1:
        return  InfoWidget(title: 'Coming soon',icon: Icons.calendar_month,);
      case 2:
        return InfoWidget(title: 'Coming soon',icon: Icons.calendar_month,);
      case 3:
        return InfoWidget(title: 'Coming soon',icon: Icons.calendar_month,);
      default:
        return InfoWidget(title: 'Coming soon',icon: Icons.calendar_month,);
    }
  }
}

