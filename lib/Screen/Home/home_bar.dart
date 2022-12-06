import 'package:delta/Screen/DrawerNav/about_app.dart';
import 'package:delta/Screen/DrawerNav/blogs.dart';
import 'package:delta/Screen/DrawerNav/contact_us.dart';
import 'package:delta/Screen/DrawerNav/notifications.dart';
import 'package:delta/Screen/Home/projectDetails.dart';
import 'package:delta/Screen/DrawerNav/profile.dart';
import 'package:delta/Screen/DrawerNav/technical_support.dart';
import 'package:flutter/material.dart';

import 'designs.dart';
import 'home_page.dart';
import 'order_track.dart';

class HomeBar extends StatefulWidget {
   HomeBar({Key key}) : super(key: key);

  @override
  _HomeBarState createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OrderTrack(),
    Designs()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/home.png"),
                size: 35,
              ),
              label: 'الرئيسية',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/gps.png",
                ),
                size: 35,
              ),
              label: 'تتبع حالةالطلب',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage("assets/images/projects.png"), size: 35),
              label: 'مشاريعنا',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          backgroundColor: Colors.amber[800],
          selectedFontSize: 17,
          unselectedFontSize: 17,
          selectedItemColor: Colors.white,
          iconSize: 35,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
