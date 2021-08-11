

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Home/order_track.dart';

import 'Screen/DrawerNav/about_app.dart';
import 'Screen/DrawerNav/blogs.dart';
import 'Screen/DrawerNav/contact_us.dart';
import 'Screen/DrawerNav/not_logged_in.dart';
import 'Screen/DrawerNav/notifications.dart';
import 'Screen/DrawerNav/profile.dart';
import 'Screen/DrawerNav/technical_support.dart';
import 'Screen/login.dart';


class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.size,
    @required this.token,
  }) : super(key: key);

  final Size size;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .9,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 55,
            ),
            ListTile(
              trailing: Icon(Icons.home),
              title: Text(
                ' الرئيسية',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeBar()));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.request_page),
              title: Text(
                'طلباتي ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: ()async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                var jwt =  pref.getString('token');

                jwt != null  ?   Navigator.push(context,
                    MaterialPageRoute(builder: (_) => OrderTrack()))
                    :  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotLogged(title:"تتبع حالة الطلب")));

              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.comment),
              title: Text(
                'الاخبار والمدونات',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Blogs()));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.notifications),
              title: Text(
                'الاشعارات',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: ()async {
                // Update the state of the app
                // ...
                // Then close the drawer
                SharedPreferences pref = await SharedPreferences.getInstance();
                var jwt =  pref.getString('token');

                jwt != null  ?   Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Notify()))
                    :  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotLogged(title:"الاشعارات")));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.support),
              title: Text(
                'الدعم الفني',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: ()async {
                //TechSupport
                SharedPreferences pref = await SharedPreferences.getInstance();
                var jwt =  pref.getString('token');

                jwt != null  ?   Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TechSupport()))
                    :  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotLogged(title:"الدعم الفني")));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.contact_phone_outlined),
              title: Text(
                'تواصل معنا',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ContactUs()));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.apps_outlined),
              title: Text(
                'عن التطبيق',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AboutApp()));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.person),
              title: Text(
                'البروفايل',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                var jwt =  pref.getString('token');

                jwt != null  ?   Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Profile()))
                    :  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotLogged(title:"البروفايل")));
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              trailing: Icon(Icons.login),
              title: Text(
                token!=null?'تسجيل خروج':'تسجيل دخول',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'GE SS Two',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: ()async {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.getKeys();
                for(String key in preferences.getKeys()) {
                  preferences.remove(key);
                }
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
