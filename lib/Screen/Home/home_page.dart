import 'dart:ui';

import 'package:delta/DataModel/home_model.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/DesignNow/design_now_home.dart';
import 'package:delta/Screen/DrawerNav/not_logged_in.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/draw.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils.dart';
import '../Real_estate_investment.dart';
import '../build_cost.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../contract_offers.dart';
import '../engineering_services.dart';
import '../general_fix.dart';
import '../other_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token;
  List<Widget> itemSliders = [];
  List<Widget> itemCat = [];

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    Repository _repo = Repository();

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.1;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * .12,
              height: size.height * .03,
              child: Image.asset(
                "assets/images/logo-11.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff3b6745),
      ),
      endDrawer: NewWidget(size: size, token: token),
      body: StreamBuilder<HomeM>(
          stream: _repo.getHome(token_id: token, key: "1234567890").asStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              itemCat = [];
              for (int i = 0; i < snapshot.data.result.mainOffers.length; i++) {
                itemSliders.add(Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber),
                        child: GestureDetector(
                          onTap: () async {
                            Utils.openLink(
                                url:
                                    "https://${snapshot.data.result.mainOffers[i].link}");
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              snapshot.data.result.mainOffers[i].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))));
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: sWidth,
                        height: sHeight * .20,
                        child: null ??
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CarouselSlider(
                                items: itemSliders,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: .95,
                                  aspectRatio: 2,
                                  height: size.height * .35,
                                  enlargeCenterPage: true,
                                ),
                              ),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Container(
                          width: sWidth,
                          child: Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: GridView.count(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 6.0,
                                    crossAxisSpacing: 6.0,
                                    childAspectRatio: (itemWidth / itemHeight),
                                    controller: new ScrollController(
                                        keepScrollOffset: false),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  SharedPreferences pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  var jwt =
                                                      pref.getString('token');
                                                  jwt != null
                                                      ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  BuildingCost(
                                                                    cat_id: snapshot
                                                                        .data
                                                                        .result
                                                                        .allCategories[
                                                                            0]
                                                                        .catId
                                                                        .toString(),
                                                                    jwt: jwt,
                                                                  )))
                                                      : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  NotLogged(
                                                                      title:
                                                                          "${snapshot.data.result.allCategories[0].categoryName}")));
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      0]
                                                                  .categoryImg),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      width: sWidth * .2,
                                                      height: sWidth * .2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        child: Text(
                                                          "${snapshot.data.result.allCategories[0].categoryName}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'GE SS Two',
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xff848484),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                      Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  SharedPreferences pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  var jwt =
                                                      pref.getString('token');
                                                  jwt != null
                                                      ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ContractOffers(
                                                                    cat_id: snapshot
                                                                        .data
                                                                        .result
                                                                        .allCategories[
                                                                            1]
                                                                        .catId
                                                                        .toString(),
                                                                    jwt: jwt,
                                                                  )))
                                                      : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  NotLogged(
                                                                      title:
                                                                          "${snapshot.data.result.allCategories[1].categoryName}")));
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      1]
                                                                  .categoryImg),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      width: sWidth * .2,
                                                      height: sWidth * .2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        child: Text(
                                                          "${snapshot.data.result.allCategories[1].categoryName}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'GE SS Two',
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xff848484),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                      Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  SharedPreferences pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  var jwt =
                                                      pref.getString('token');

                                                  jwt != null
                                                      ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  EngineeringServices(
                                                                    cat_id: snapshot
                                                                        .data
                                                                        .result
                                                                        .allCategories[
                                                                            2]
                                                                        .catId
                                                                        .toString(),
                                                                    jwt: jwt,
                                                                  )))
                                                      : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  NotLogged(
                                                                      title:
                                                                          "${snapshot.data.result.allCategories[2].categoryName}")));
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      2]
                                                                  .categoryImg),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      width: sWidth * .2,
                                                      height: sWidth * .2,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "${snapshot.data.result.allCategories[2].categoryName}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'GE SS Two',
                                                          fontSize: 14,
                                                          color: const Color(
                                                              0xff848484),
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                      Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  SharedPreferences pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  var jwt =
                                                      pref.getString('token');
                                                  jwt != null
                                                      ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  RealEstateInvestment(
                                                                    cat_id: snapshot
                                                                        .data
                                                                        .result
                                                                        .allCategories[
                                                                            3]
                                                                        .catId
                                                                        .toString(),
                                                                    jwt: jwt,
                                                                  )))
                                                      : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  NotLogged(
                                                                      title:
                                                                          "${snapshot.data.result.allCategories[3].categoryName}")));
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      3]
                                                                  .categoryImg),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      width: sWidth * .2,
                                                      height: sWidth * .2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      child: Container(
                                                        child: Text(
                                                          "${snapshot.data.result.allCategories[3].categoryName}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'GE SS Two',
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xff848484),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: GestureDetector(
                                            onTap: () async {
                                              SharedPreferences pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              var jwt = pref.getString('token');

                                              jwt != null
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              otherServices(
                                                                cat_id: snapshot
                                                                    .data
                                                                    .result
                                                                    .allCategories[
                                                                        4]
                                                                    .catId
                                                                    .toString(),
                                                                jwt: jwt,
                                                              )))
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) => NotLogged(
                                                              title:
                                                                  "${snapshot.data.result.allCategories[4].categoryName}")));
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      4]
                                                                  .categoryImg),
                                                          fit: BoxFit.cover),
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  width: sWidth * .2,
                                                  height: sWidth * .2,
                                                ),
                                                SizedBox(
                                                  height: sHeight * .015,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    child: Text(
                                                      "${snapshot.data.result.allCategories[4].categoryName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                        fontFamily: 'GE SS Two',
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff848484),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: GestureDetector(
                                            onTap: () async {
                                              SharedPreferences pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              var jwt = pref.getString('token');

                                              jwt != null
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              DesignNowHome(
                                                                cat_id: snapshot
                                                                    .data
                                                                    .result
                                                                    .allCategories[
                                                                        5]
                                                                    .catId
                                                                    .toString(),
                                                                jwt: jwt,
                                                              )))
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) => NotLogged(
                                                              title:
                                                                  "${snapshot.data.result.allCategories[5].categoryName}")));
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      5]
                                                                  .categoryImg),
                                                          fit: BoxFit.cover),
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  width: sWidth * .2,
                                                  height: sWidth * .2,
                                                ),
                                                SizedBox(
                                                  height: sHeight * .01,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    child: Text(
                                                      "${snapshot.data.result.allCategories[5].categoryName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                        fontFamily: 'GE SS Two',
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff848484),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: GestureDetector(
                                            onTap: () async {
                                              SharedPreferences pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              var jwt = pref.getString('token');

                                              jwt != null
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              GeneralFix(
                                                                cat_id: snapshot
                                                                    .data
                                                                    .result
                                                                    .allCategories[
                                                                        6]
                                                                    .catId
                                                                    .toString(),
                                                                jwt: jwt,
                                                              )))
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) => NotLogged(
                                                              title:
                                                                  "${snapshot.data.result.allCategories[6].categoryName}")));
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      6]
                                                                  .categoryImg),
                                                          fit: BoxFit.cover),
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  width: sWidth * .2,
                                                  height: sWidth * .2,
                                                ),
                                                SizedBox(
                                                  height: sHeight * .01,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    child: Text(
                                                      "${snapshot.data.result.allCategories[6].categoryName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                        fontFamily: 'GE SS Two',
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff848484),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: GestureDetector(
                                            onTap: () async {
                                              SharedPreferences pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          Designs()));
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      7]
                                                                  .categoryImg),
                                                          fit: BoxFit.cover),
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  width: sWidth * .2,
                                                  height: sWidth * .2,
                                                ),
                                                SizedBox(
                                                  height: sHeight * .015,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    child: Text(
                                                      "${snapshot.data.result.allCategories[7].categoryName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                        fontFamily: 'GE SS Two',
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff848484),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: GestureDetector(
                                            onTap: () async {
                                              SharedPreferences pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              var jwt = pref.getString('token');

                                              jwt != null
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              BuildingCost(
                                                                cat_id: snapshot
                                                                    .data
                                                                    .result
                                                                    .allCategories[
                                                                        0]
                                                                    .catId
                                                                    .toString(),
                                                                jwt: jwt,
                                                              )))
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) => NotLogged(
                                                              title:
                                                                  "${snapshot.data.result.allCategories[8].categoryName}")));
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data
                                                                  .result
                                                                  .allCategories[
                                                                      8]
                                                                  .categoryImg),
                                                          fit: BoxFit.cover),
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  width: sWidth * .2,
                                                  height: sWidth * .2,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Container(
                                                    child: Text(
                                                      "${snapshot.data.result.allCategories[8].categoryName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                        fontFamily: 'GE SS Two',
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff848484),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                              )

                              // Padding(
                              //   padding: const EdgeInsets.all(5.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Padding(
                              //           padding: const EdgeInsets.all(2.0),
                              //           child: Container(
                              //          //   alignment: Alignment.center,
                              //               width: sWidth * .3,
                              //               height: sHeight * .1,
                              //               margin: EdgeInsets.symmetric(
                              //                   horizontal: 5.0),
                              //               decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(10),
                              //                 border:Border.all(color: Colors.grey),
                              //                 color: snapshot
                              //                             .data
                              //                             .result
                              //                             .allCategories[0]
                              //                             .categoryColor !=
                              //                         ''
                              //                     ? _getColorFromHex(snapshot
                              //                         .data
                              //                         .result
                              //                         .allCategories[0]
                              //                         .categoryColor)
                              //                     : Colors.transparent,
                              //               ),
                              //               child: GestureDetector(
                              //                 onTap: () async {
                              //                   SharedPreferences pref = await SharedPreferences.getInstance();
                              //                   var jwt =  pref.getString('token');
                              //
                              //                   jwt != null  ?      Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                   snapshot.data
                              //                       .result
                              //                       .allCategories[0].catId.toString(),jwt: jwt,)))
                              //                       :  Navigator.push(context,
                              //                       MaterialPageRoute(builder: (_) => NotLogged(title:"تكلفة البناء")));
                              //                 },
                              //                 child: Center(
                              //                   child: Padding(
                              //                     padding:
                              //                         const EdgeInsets.all(8.0),
                              //                     child: Text(
                              //                       "${snapshot.data.result.allCategories[0].categoryName}"
                              //                       ,textDirection: TextDirection.rtl,
                              //                       textAlign: TextAlign.center,
                              //                       style: TextStyle(
                              //                         fontFamily: 'GE SS Two',
                              //                         fontSize: 15,
                              //                         color:
                              //                             snapshot.data
                              //                           .result
                              //                           .allCategories[0]
                              //                           .categoryColor !=
                              //                           ''
                              //                           ? Color(0xFFFFFFFF):Color(
                              //                                 0xff232222),
                              //                         fontWeight: FontWeight.w300,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               )))
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(5.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Expanded(
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(2.0),
                              //           child: Container(
                              //             width: sWidth * .3,
                              //             height: sHeight * .1,
                              //             margin:
                              //                 EdgeInsets.symmetric(horizontal: 5.0),
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(10),
                              //               border:Border.all(color: Colors.grey),
                              //               color: snapshot
                              //                           .data
                              //                           .result
                              //                           .allCategories[1]
                              //                           .categoryColor !=
                              //                       ''
                              //                   ? _getColorFromHex(snapshot
                              //                       .data
                              //                       .result
                              //                       .allCategories[1]
                              //                       .categoryColor)
                              //                   : Colors.transparent,
                              //             ),
                              //             child: GestureDetector(
                              //               onTap: () async {
                              //                 Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                 snapshot.data
                              //                     .result
                              //                     .allCategories[0].catId.toString(),)));
                              //                 // Navigator.push(context, MaterialPageRoute(builder: (_)=>ContractOffers()));
                              //               },
                              //               child: Center(
                              //                 child: Text(
                              //                   "${snapshot.data.result.allCategories[1].categoryName}",
                              //                     textDirection: TextDirection.rtl,
                              //                 textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                     fontFamily: 'GE SS Two',
                              //                     fontSize: 15,
                              //                   color:
                              //                       snapshot.data
                              //                           .result
                              //                           .allCategories[1]
                              //                       .categoryColor !=
                              //                       ''
                              //                       ? Color(0xFFFFFFFF):Color(
                              //                     0xff232222),
                              //                     fontWeight: FontWeight.w300,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(2.0),
                              //           child: Container(
                              //             width: sWidth * .3,
                              //             height: sHeight * .1,
                              //             margin:
                              //                 EdgeInsets.symmetric(horizontal: 5.0),
                              //             decoration: BoxDecoration(
                              //               border:Border.all(color: Colors.grey),
                              //               borderRadius: BorderRadius.circular(10),
                              //               color: snapshot
                              //                           .data
                              //                           .result
                              //                           .allCategories[2]
                              //                           .categoryColor !=
                              //                       ''
                              //                   ? _getColorFromHex(snapshot
                              //                       .data
                              //                       .result
                              //                       .allCategories[2]
                              //                       .categoryColor)
                              //                   : Colors.transparent,
                              //             ),
                              //             child: GestureDetector(
                              //               onTap: () async {
                              //                 Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                 snapshot.data
                              //                     .result
                              //                     .allCategories[0].catId.toString(),)));
                              //             //    Navigator.push(context, MaterialPageRoute(builder: (_)=>EngineeringServices()));
                              //               },
                              //               child: Center(
                              //                 child: Text(
                              //                   "${snapshot.data.result.allCategories[2].categoryName}",
                              //                   textDirection: TextDirection.rtl,
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                     fontFamily: 'GE SS Two',
                              //                     fontSize: 15,
                              //                     color:
                              //                     snapshot.data
                              //                         .result
                              //                         .allCategories[2]
                              //                         .categoryColor !=
                              //                         ''
                              //                         ? Color(0xFFFFFFFF):Color(
                              //                         0xff232222),
                              //                     fontWeight: FontWeight.w300,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Padding(
                              //             padding: const EdgeInsets.all(2.0),
                              //             child: Container(
                              //               alignment: Alignment.center,
                              //                 width: sWidth * .3,
                              //                 height: sHeight * .1,
                              //                 margin: EdgeInsets.symmetric(
                              //                     horizontal: 5.0),
                              //                 decoration: BoxDecoration(
                              //                   border: Border.all(color: Colors.grey,),
                              //                   borderRadius:
                              //                       BorderRadius.circular(10),
                              //                   color: snapshot
                              //                               .data
                              //                               .result
                              //                               .allCategories[3]
                              //                               .categoryColor !=
                              //                           ''
                              //                       ? _getColorFromHex(snapshot
                              //                           .data
                              //                           .result
                              //                           .allCategories[3]
                              //                           .categoryColor)
                              //                       : Colors.transparent,
                              //                 ),
                              //                 child: GestureDetector(
                              //                   onTap: () async {
                              //                  //   Navigator.push(context, MaterialPageRoute(builder: (_) =>  RealEstateInvestment()));
                              //                     Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                     snapshot.data
                              //                         .result
                              //                         .allCategories[0].catId.toString(),)));
                              //                   },
                              //                   child: Center(
                              //                     child: Text(
                              //                       "${snapshot.data.result.allCategories[3].categoryName}",
                              //                       textDirection: TextDirection.rtl,
                              //                       textAlign: TextAlign.center,
                              //                       style: TextStyle(
                              //                         fontFamily: 'GE SS Two',
                              //                         fontSize: 15,
                              //                         color:
                              //                         snapshot.data
                              //                             .result
                              //                             .allCategories[3]
                              //                             .categoryColor !=
                              //                             ''
                              //                             ? Color(0xFFFFFFFF):Color(
                              //                             0xff232222),
                              //                         fontWeight: FontWeight.w300,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ))),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(5.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Expanded(
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(2.0),
                              //           child: Container(
                              //             width: sWidth * .3,
                              //             height: sHeight * .1,
                              //             margin:
                              //             EdgeInsets.symmetric(horizontal: 5.0),
                              //             decoration: BoxDecoration(
                              //                  border:Border.all(color: Colors.grey),
                              //               borderRadius: BorderRadius.circular(10),
                              //               color: snapshot
                              //                   .data
                              //                   .result
                              //                   .allCategories[4]
                              //                   .categoryColor !=
                              //                   ''
                              //                   ? _getColorFromHex(snapshot
                              //                   .data
                              //                   .result
                              //                   .allCategories[4]
                              //                   .categoryColor)
                              //                   : Colors.transparent,
                              //             ),
                              //             child: GestureDetector(
                              //               onTap: () async {
                              //
                              //                 Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                 snapshot.data
                              //                     .result
                              //                     .allCategories[0].catId.toString(),)));
                              //               },
                              //               child: Center(
                              //                 child: Text(
                              //                   "${snapshot.data.result.allCategories[4].categoryName}",
                              //                   textDirection: TextDirection.rtl,
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                     fontFamily: 'GE SS Two',
                              //                     fontSize: 15,
                              //                     color:
                              //                     snapshot.data
                              //                         .result
                              //                         .allCategories[4]
                              //                         .categoryColor !=
                              //                         ''
                              //                         ? Color(0xFFFFFFFF):Color(
                              //                         0xff232222),
                              //                     fontWeight: FontWeight.w300,
                              //
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(2.0),
                              //           child: Container(
                              //             width: sWidth * .3,
                              //             height: sHeight * .1,
                              //             margin:
                              //             EdgeInsets.symmetric(horizontal: 5.0),
                              //
                              //             decoration: BoxDecoration(
                              //               border:Border.all(color: Colors.grey),
                              //               borderRadius: BorderRadius.circular(10),
                              //               color: snapshot
                              //                   .data
                              //                   .result
                              //                   .allCategories[5]
                              //                   .categoryColor !=
                              //                   ''
                              //                   ? _getColorFromHex(snapshot
                              //                   .data
                              //                   .result
                              //                   .allCategories[5]
                              //                   .categoryColor)
                              //                   : Colors.transparent,
                              //             ),
                              //             child: GestureDetector(
                              //               onTap: () async {
                              //                 Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                 snapshot.data
                              //                     .result
                              //                     .allCategories[0].catId.toString(),)));
                              //               },
                              //               child: Center(
                              //                 child: Text(
                              //                   "${snapshot.data.result.allCategories[5].categoryName}",
                              //                   textDirection: TextDirection.rtl,
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                     fontFamily: 'GE SS Two',
                              //                     fontSize: 15,
                              //                     color:
                              //                     snapshot.data
                              //                         .result
                              //                         .allCategories[5]
                              //                         .categoryColor !=
                              //                         ''
                              //                         ? Color(0xFFFFFFFF):Color(
                              //                         0xff232222),
                              //                     fontWeight: FontWeight.w300,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Padding(
                              //             padding: const EdgeInsets.all(2.0),
                              //             child: Container(
                              //
                              //                 alignment: Alignment.center,
                              //                 width: sWidth * .3,
                              //                 height: sHeight * .1,
                              //                 margin: EdgeInsets.symmetric(
                              //                     horizontal: 5.0),
                              //                 decoration: BoxDecoration(
                              //                   border:Border.all(color: Colors.grey),
                              //                   borderRadius:
                              //                   BorderRadius.circular(10),
                              //                   color: snapshot
                              //                       .data
                              //                       .result
                              //                       .allCategories[6]
                              //                       .categoryColor !=
                              //                       ''
                              //                       ? _getColorFromHex(snapshot
                              //                       .data
                              //                       .result
                              //                       .allCategories[6]
                              //                       .categoryColor)
                              //                       : Colors.transparent,
                              //                 ),
                              //                 child: GestureDetector(
                              //                   onTap: () async {
                              //                     Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                     snapshot.data
                              //                         .result
                              //                         .allCategories[0].catId.toString(),)));
                              //                   },
                              //                   child: Center(
                              //                     child: Text(
                              //                       "${snapshot.data.result.allCategories[6].categoryName}",
                              //                       textDirection: TextDirection.rtl,
                              //                       textAlign: TextAlign.center,
                              //                       style: TextStyle(
                              //                         fontFamily: 'GE SS Two',
                              //                         fontSize: 15,
                              //                         color:
                              //                         snapshot.data
                              //                             .result
                              //                             .allCategories[6]
                              //                             .categoryColor !=
                              //                             ''
                              //                             ? Color(0xFFFFFFFF):Color(
                              //                             0xff232222),
                              //                         fontWeight: FontWeight.w300,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ))),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(5.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Padding(
                              //           padding: const EdgeInsets.all(2.0),
                              //           child: Container(
                              //               width: sWidth * .3,
                              //               height: sHeight * .1,
                              //               margin: EdgeInsets.symmetric(
                              //                   horizontal: 5.0),
                              //               decoration: BoxDecoration(
                              //                 border:Border.all(color: Colors.grey),                                            borderRadius:
                              //
                              //                 BorderRadius.circular(10),
                              //                 color: snapshot
                              //                     .data
                              //                     .result
                              //                     .allCategories[7]
                              //                     .categoryColor !=
                              //                     ''
                              //                     ? _getColorFromHex(snapshot
                              //                     .data
                              //                     .result
                              //                     .allCategories[7]
                              //                     .categoryColor)
                              //                     : Colors.transparent,
                              //               ),
                              //               child: GestureDetector(
                              //                 onTap: () async {
                              //                   Navigator.push(context, MaterialPageRoute(builder: (_)=>BuildingCost(cat_id:
                              //                   snapshot.data
                              //                       .result
                              //                       .allCategories[0].catId.toString(),)));
                              //                 },
                              //                 child: Center(
                              //                   child: Text(
                              //                     "${snapshot.data.result.allCategories[7].categoryName}",
                              //                     style: TextStyle(
                              //                       fontFamily: 'GE SS Two',
                              //                       fontSize: 15,
                              //                       color:
                              //                         snapshot.data
                              //                             .result
                              //                             .allCategories[7]
                              //                         .categoryColor !=
                              //                         ''
                              //                         ? Color(0xFFFFFFFF):Color(
                              //                       0xff232222),                                                    fontWeight: FontWeight.w300,
                              //                     ),
                              //                   ),
                              //                 ),
                              //               )))
                              //     ],
                              //   ),
                              // ),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
            }
          }),
    );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
