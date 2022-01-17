import 'dart:io';

import 'package:delta/DataModel/FormsModels/other_servicesM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../draw.dart';
import 'Home/home_bar.dart';

class otherServices extends StatefulWidget {
  otherServices({Key key, this.cat_id, this.jwt}) : super(key: key);

  String cat_id;
  String jwt;
  @override
  _otherServicesState createState() => _otherServicesState();
}

String token;

class _otherServicesState extends State<otherServices> {
  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }

  @override
  void initState() {
    token = "";
    gettoken();
    print(token);
    super.initState();
  }

  Repository _repo = Repository();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<OtherServicesM>(
          stream: _repo
              .getOtherServicesF(
                  key: '1234567890',
                  token_id: widget.jwt,
                  cat_id: widget.cat_id)
              .asStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Scaffold(
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
                              onPressed: () =>
                                  Scaffold.of(context).openEndDrawer(),
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
                          "${snapshot.data.result.categoryDate.title}",
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
                  endDrawer: NewWidget(token: token, size: size),
                  body: SingleChildScrollView(
                      child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${snapshot.data.result.categoryDate.title}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              color: Color(0xfff3a005),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height * .09,
                          width: size.width * .85,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ElevatedButton(
                              child: Text(
                                '${snapshot.data.result.categoryDate.description}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Color(0xfff3a005),
                                onPrimary: Colors.orangeAccent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => HomeBar()));
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height * .06,
                            width: size.width * .85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: size.height * 1,
                                  width: size.width * 1),
                              child: ElevatedButton(
                                  child: Text(
                                    '${snapshot.data.result.categoryDate.details}',
                                    style: TextStyle(
                                      fontFamily: 'GE SS Two',
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 20,
                                    primary: Color(0xfff3a005),
                                    onPrimary: Colors.orangeAccent,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                  onPressed: () {
                                    Utils.openLink(
                                        url: 'https://www.youtube.com');
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (_) => HomeBar()));
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: (){
                          if(Platform.isAndroid){
                            Utils.openLink(url: snapshot.data.result.categoryDate.playStoreLink);
                          }else{
                            Utils.openLink(url: snapshot.data.result.categoryDate.appStoreLink);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " قم بمشاركة التطبيق",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'GE SS Two',
                                fontSize: 20,
                                color: Color(0xfff3a005),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
