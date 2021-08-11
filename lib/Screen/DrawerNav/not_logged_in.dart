


import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Home/order_track.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../draw.dart';
import '../login.dart';
import '../signup.dart';
import 'about_app.dart';
import 'blogs.dart';
import 'contact_us.dart';
import 'notifications.dart';
import 'profile.dart';
import 'technical_support.dart';


class NotLogged extends StatefulWidget {
   NotLogged({Key key,this.title}) : super(key: key);
String title;

  @override
  _NotLoggedState createState() => _NotLoggedState();
}

class _NotLoggedState extends State<NotLogged> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer:  NewWidget(size: size, token: null),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            child: Builder(
              builder: (context) => Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 6.0, right: 10.0),
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage("assets/images/menu.png"),
                    size: 25,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context)
                      .openAppDrawerTooltip,
                ),
              ),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "${widget.title}",
              style: TextStyle(
                fontFamily: 'GE SS Two',
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff3b6745),
      ),
      body: Container(
        child:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("من فضلك قم بتسجيل الدخول",   style:   TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 25,
              color: const Color(0xff3b6745),
              fontWeight: FontWeight.w300,
            ),),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                height: size.height * .06,
                width: size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      height:size.height * 1, width: size.width * 1),
                  child: ElevatedButton(
                      child: Text(
                        'تسجيل حساب',
                        style:   TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 17,
                          color: const Color(0xfffcfbfb),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary:  Color(0xfff3a005),
                        onPrimary: Colors.orangeAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: ()async {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
                      }
                  ),
                ),
              ),
            ),
          ],
        ))
      ),
    );
  }
}
