import 'package:delta/DataModel/about_usM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Home/order_track.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import '../login.dart';
import 'about_app.dart';
import 'blogs.dart';
import 'contact_us.dart';
import 'not_logged_in.dart';
import 'notifications.dart';
import '../Home/projectDetails.dart';
import 'profile.dart';
import 'technical_support.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  String token;

  Future<String> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  @override
  void initState() {
    gettoken();
    super.initState();
  }

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                ),
              ),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "عن التطبيق",
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
        endDrawer:  NewWidget(size: size, token: token),
        body: StreamBuilder<AboutUsM>(
            stream: _repo
                .getAboutApp(token_id: token, key: "1234567890")
                .asStream(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * .5,
                            height: size.height * .12,
                            child: Image.asset(
                              "assets/images/logo.png",
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 8.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 8.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: size.width * .8,
                              height: size.height * .05,
                              child: snapshot.data.result.aboutTitle == ""
                                  ? Text(
                                      "للمقاولات العامة والاستشارات الهندسية والإستثمار العقاري",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      "${snapshot.data.result.aboutTitle}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 19,
                                  color: Color(0xfff3a005),
                                  fontWeight: FontWeight.normal,
                                ),
                                    ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: size.width * .8,
                              child: snapshot.data.result.aboutTxt != ""
                                  ? SingleChildScrollView(
                                    child: Text(
                                        "${snapshot.data.result.aboutTxt}",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      ),
                                  )
                                  : SingleChildScrollView(
                                    child: Text(
                                        "بدأنا كشركة ليبية متخصصة، عندما أسسنا شركة مثلثدلتا في الاستشارات الهندسية -سنة 2012 ميلاديةبطموح خبرات شابة، عملت وتقلدت مناصب تنفيذيةوإدارية في شركات عدة، المحلية منها، والأجنبيةوفي مجالات متنوعة كالخدمات النفطية، والاستشارات الهندسية، والمقاولات العامة",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                  ))
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 8.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: size.width * .8,
                              height: size.height * .05,
                              child: snapshot.data.result.messageTitle != ""
                                  ? Text(
                                      "${snapshot.data.result.messageTitle}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 22,
                                  color: Color(0xfff3a005),
                                  fontWeight: FontWeight.normal,
                                ),
                                    )
                                  : Text(
                                      "رسالتنا",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: size.width * .8,
                              child: snapshot.data.result.messageTxt != ""
                                  ? Text(
                                      "${snapshot.data.result.messageTxt}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                                    )
                                  : Text(
                                      "نكافح من أجل تقديم منتج و خدمات موثوقة ومميزةعن علم وأمانة لتلبية رغبات وحاجات عملائنا مع اعتبار الانسان والطبيعة.",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ))
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 8.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: size.width * .8,
                              height: size.height * .05,
                              child: snapshot.data.result.visionTitle != ""
                                  ? Text(
                                      "${snapshot.data.result.visionTitle}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 22,
                                  color: Color(0xfff3a005),
                                  fontWeight: FontWeight.normal,
                                ),
                                    )
                                  : Text(
                                      "رؤيتنا",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: size.width * .8,
                            child: snapshot.data.result.visionTxt != ""
                                ? Text(
                                    "${snapshot.data.result.visionTxt}",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'GE SS Two',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ))
                                : Text(
                                    "الشركة التي تضيف قيمة في مجالاتها المتعددة.",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: 'GE SS Two',
                                      fontSize: 020,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                      thickness: 2,
                    ),
                  ]),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
