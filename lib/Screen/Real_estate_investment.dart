import 'package:delta/DataModel/FormsModels/real_state_investmentM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/draw.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/home_bar.dart';
import 'send_done.dart';

class RealEstateInvestment extends StatefulWidget {
  RealEstateInvestment({Key key, this.jwt, this.cat_id}) : super(key: key);
  String cat_id;
  String jwt;
  @override
  _RealEstateInvestmentState createState() => _RealEstateInvestmentState();
}

enum SingingCharacterDirection { north, South, east, West }
enum SingingCharacter { yes, no }
enum SingingCharacter2 { daily, monthly }
enum SingingCharacter3 { private, Separated }
enum SingingCharacter4 { female, male }

//
SingingCharacter _character = SingingCharacter.yes;
SingingCharacterDirection _characterDirection = SingingCharacterDirection.north;

//
SingingCharacter _character1 = SingingCharacter.yes;
SingingCharacter _character2 = SingingCharacter.yes;
SingingCharacter _character3 = SingingCharacter.yes;
SingingCharacter _character4 = SingingCharacter.yes;
SingingCharacter _character5 = SingingCharacter.yes;
SingingCharacter _character6 = SingingCharacter.yes;
SingingCharacter2 _character7 = SingingCharacter2.daily;
SingingCharacter3 _character8 = SingingCharacter3.private;
SingingCharacter4 _character9 = SingingCharacter4.female;

TextEditingController Id1 = TextEditingController();
TextEditingController Id2 = TextEditingController();
TextEditingController Id3 = TextEditingController();
TextEditingController Id4 = TextEditingController();
TextEditingController Id5 = TextEditingController();
TextEditingController Id6 = TextEditingController();
TextEditingController Id7 = TextEditingController();
TextEditingController Id8 = TextEditingController();
TextEditingController Id9 = TextEditingController();
TextEditingController Id10 = TextEditingController();
List _list1;
int listId1;
List _list2;
int listId2;
List _list3;
int listId3;
List _list4;
int listId4;
List _list5;
int listId5;
List _list6;
int listId6;
List _list7;
int listId7;
List _list8;
int listId8;
List _list9;
int listId9;
List _list10;
int listId10;
List _list22;
int listId22;

List _list11;
int Id11;
List _list12;
int Id12;
List _list13;
int Id13;

class _RealEstateInvestmentState extends State<RealEstateInvestment> {
  var dropdownValue1 = 'نوع المبني المطلوب';

  num _counter1 = 0;
  num _counter2 = 0;
  num _counter3 = 0;
  num _counter4 = 0;
  void _increment() {
    setState(() {
      _counter1++;
    });
  }

  void _dicrement() {
    setState(() {
      _counter1--;
    });
  }

  void _increment2() {
    setState(() {
      _counter2++;
    });
  }

  void _dicrement2() {
    setState(() {
      _counter2--;
    });
  }

  void _increment3() {
    setState(() {
      _counter3++;
    });
  }

  void _dicrement3() {
    setState(() {
      _counter3--;
    });
  }

  void _increment4() {
    setState(() {
      _counter4++;
    });
  }

  void _dicrement4() {
    setState(() {
      _counter4--;
    });
  }

  var baseurl = 'https://mdecco.com/app/';
  String token;
  Dio dio = Dio();
  Future<RealStateM> getRealStateF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    RealStateM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_real_estate_investment_offers',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = RealStateM.fromMap(value.data);
    });
    setState(() {
      _list1 = data.result.lableList[0].listAnwser.toList();
      _list7 = data.result.lableList[6].listAnwser.toList();
      _list2 = data.result.lableList[14].listAnwser.toList();
      _list3 = data.result.lableList[15].listAnwser.toList();
      _list4 = data.result.lableList[16].listAnwser.toList();
      _list5 = data.result.lableList[17].listAnwser.toList();
      _list6 = data.result.lableList[18].listAnwser.toList();
      _list8 = data.result.lableList[19].listAnwser.toList();
      _list9 = data.result.lableList[20].listAnwser.toList();
      _list10 = data.result.lableList[21].listAnwser.toList();
      _list22 = data.result.lableList[22].listAnwser.toList();
      _list11 = data.result.lableList[11].listAnwser.toList();
      _list12 = data.result.lableList[12].listAnwser.toList();
      _list13 = data.result.lableList[13].listAnwser.toList();
    });
    return data;
  }

  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }

  @override
  void initState() {
    this.getRealStateF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
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
      child: StreamBuilder<RealStateM>(
          stream: _repo
              .getRealStateF(
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: sWidth * .8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.categoryDate.description}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //0
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[0].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[0].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            // controller: Id0,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, bottom: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(),
                                              ),
                                              height: 50,
                                              width: size.width * .8,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                width: size.width * .8,
                                                child: _list1 != null
                                                    ? DropdownButton(
                                                        isExpanded: true,
                                                        items: _list1.map((e) {
                                                          return new DropdownMenuItem(
                                                            child: Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: new Text(
                                                                  e.title,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'GE SS Two',
                                                                    fontSize:
                                                                        17,
                                                                    color: const Color(
                                                                        0xff848484),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                  textDirection:
                                                                      TextDirection
                                                                          .rtl,
                                                                )),
                                                            value: e.answerId,
                                                          );
                                                        }).toList(),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            listId1 = val;
                                                            print(
                                                                Id3.toString());
                                                          });
                                                        },
                                                        value: listId1,
                                                      )
                                                    : Container(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //1
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[1].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  child: snapshot
                                              .data.result.lableList[1].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id1,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ))
                                      : Container()
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       Container(
                                  //         decoration: BoxDecoration(
                                  //           border: Border(),
                                  //         ),
                                  //         height: 50,
                                  //         width: size.width * .8,
                                  //         child: Container(
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.white,
                                  //           ),
                                  //           width: size.width*.8,
                                  //           child: _list3!=null?
                                  //           DropdownButton(
                                  //             isExpanded: true,
                                  //             items: _list3.map((e) {
                                  //               return new DropdownMenuItem(
                                  //                 child: Container(
                                  //                     alignment: Alignment.centerRight,
                                  //                     child: new Text(
                                  //                       e.title, style: TextStyle(
                                  //                       fontFamily: 'GE SS Two',
                                  //                       fontSize: 17,
                                  //                       color: const Color(0xff848484),
                                  //                       fontWeight: FontWeight.w300,
                                  //                     ),textDirection: TextDirection.rtl,)
                                  //
                                  //                 ),
                                  //                 value:  e.answerId,
                                  //               );
                                  //             }).toList(),
                                  //             onChanged: (val){
                                  //               setState(() {
                                  //                 Id3=val;
                                  //                 print(Id3.toString());
                                  //               });
                                  //             },value:Id3 ,
                                  //           ):Container(),
                                  //         ),)
                                  //     ],
                                  //   ),
                                  // ),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //2
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[2].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[2].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id2,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //3
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[3].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[3].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id3,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //4
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[4].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[4].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id4,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //5
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[5].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[5].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id5,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //6
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[6].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[6].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id6,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, bottom: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(),
                                              ),
                                              height: 50,
                                              width: size.width * .8,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                width: size.width * .8,
                                                child: _list7 != null
                                                    ? DropdownButton(
                                                        isExpanded: true,
                                                        items: _list7.map((e) {
                                                          return new DropdownMenuItem(
                                                            child: Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: new Text(
                                                                  e.title,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'GE SS Two',
                                                                    fontSize:
                                                                        17,
                                                                    color: const Color(
                                                                        0xff848484),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                  textDirection:
                                                                      TextDirection
                                                                          .rtl,
                                                                )),
                                                            value: e.answerId,
                                                          );
                                                        }).toList(),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            listId7 = val;
                                                            print(
                                                                Id5.toString());
                                                          });
                                                        },
                                                        value: listId7,
                                                      )
                                                    : Container(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //7
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[7].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  child: snapshot
                                              .data.result.lableList[7].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id7,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ))
                                      : Container()
                                  //Padding(
                                  //     padding: const EdgeInsets.only(
                                  //         top: 5.0, bottom: 8.0),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         Container(
                                  //           decoration: BoxDecoration(
                                  //             border: Border(),
                                  //           ),
                                  //           height: 50,
                                  //           width: size.width * .8,
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               color: Colors.white,
                                  //             ),
                                  //             width: size.width * .8,
                                  //             child: _list7 != null
                                  //                 ? DropdownButton(
                                  //                     isExpanded: true,
                                  //                     items: _list7.map((e) {
                                  //                       return new DropdownMenuItem(
                                  //                         child: Container(
                                  //                             alignment: Alignment
                                  //                                 .centerRight,
                                  //                             child: new Text(
                                  //                               e.title,
                                  //                               style:
                                  //                                   TextStyle(
                                  //                                 fontFamily:
                                  //                                     'GE SS Two',
                                  //                                 fontSize:
                                  //                                     17,
                                  //                                 color: const Color(
                                  //                                     0xff848484),
                                  //                                 fontWeight:
                                  //                                     FontWeight
                                  //                                         .w300,
                                  //                               ),
                                  //                               textDirection:
                                  //                                   TextDirection
                                  //                                       .rtl,
                                  //                             )),
                                  //                         value: e.answerId,
                                  //                       );
                                  //                     }).toList(),
                                  //                     onChanged: (val) {
                                  //                       setState(() {
                                  //                         Id14 = val;
                                  //                         print(
                                  //                             Id5.toString());
                                  //                       });
                                  //                     },
                                  //                     value: Id14,
                                  //                   )
                                  //                 : Container(),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //8
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[8].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[8].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id8,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //9
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[9].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: snapshot.data.result.lableList[9].type ==
                                        2
                                    ? Container(
                                        width: sWidth * .8,
                                        child: Container(
                                          child: TextField(
                                            controller: Id9,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ))
                                    : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //10
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${snapshot.data.result.lableList[10].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[10].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                controller: Id10,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                            ))
                                        : Container()
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           border: Border(),
                                //         ),
                                //         height: 50,
                                //         width: size.width * .8,
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //           ),
                                //           width: size.width*.8,
                                //           child: _list15!=null?
                                //           DropdownButton(
                                //             isExpanded: true,
                                //             items: _list15.map((e) {
                                //               return new DropdownMenuItem(
                                //                 child: Container(
                                //                     alignment: Alignment.centerRight,
                                //                     child: new Text(
                                //                       e.title, style: TextStyle(
                                //                       fontFamily: 'GE SS Two',
                                //                       fontSize: 17,
                                //                       color: const Color(0xff848484),
                                //                       fontWeight: FontWeight.w300,
                                //                     ),textDirection: TextDirection.rtl,)
                                //
                                //                 ),
                                //                 value:  e.answerId,
                                //               );
                                //             }).toList(),
                                //             onChanged: (val){
                                //               setState(() {
                                //                 Id15=val;
                                //                 print(Id5.toString());
                                //               });
                                //             },value:Id5 ,
                                //           ):Container(),
                                //         ),)
                                //     ],
                                //   ),
                                // )
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //11
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[11].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[11].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list11 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list11
                                                                .map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                Id11 = val;
                                                                print(Id11
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id11,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //12
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[12].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[12].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list12 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list12
                                                                .map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                Id12 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id12,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //13
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[13].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[13].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list13 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list13
                                                                .map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                Id13 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id13,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[14].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[14].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list3 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list2.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId2 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId2,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[15].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[15].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list3 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list3.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId3 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId3,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[16].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[16].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list4 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list4.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId4 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId4,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[17].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[17].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list5 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list5.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId5 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId5,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[18].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[18].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list6 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list6.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId6 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId6,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[19].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[19].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list8 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list8.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId8 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId8,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[20].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[20].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list9 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items:
                                                                _list9.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId9 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId9,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[21].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[21].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list10 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list10
                                                                .map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId10 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId10,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Container(
                        width: sWidth * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data.result.lableList[22].title}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xffaa6414),
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child:
                                    snapshot.data.result.lableList[22].type == 2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField())
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(),
                                                  ),
                                                  height: 50,
                                                  width: size.width * .8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    width: size.width * .8,
                                                    child: _list22 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list22
                                                                .map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                value:
                                                                    e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                listId22 = val;
                                                                print(Id12
                                                                    .toString());
                                                              });
                                                            },
                                                            value: listId22,
                                                          )
                                                        : Container(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: sWidth * .8,

                            //  alignment: Alignment.center,
                            child: Text(
                                "${snapshot.data.result.categoryDate.details}",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height * .06,
                            width: size.width * .35,
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
                                    'الغاء',
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
                                    setState(() {
                                      listId1 = null;
                                      listId2 = null;
                                      listId3 = null;
                                      listId4 = null;
                                      listId5 = null;
                                      listId6 = null;
                                      listId7 = null;
                                      listId8 = null;
                                      listId9 = null;
                                      listId10 = null;
                                      listId22 = null;
                                      Id1.text = '';
                                      Id2.text = '';
                                      Id3.text = '';
                                      Id4.text = '';
                                      Id5.text = '';
                                      Id6.text = '';
                                      Id7.text = '';
                                      Id8.text = '';
                                      Id10.text = '';
                                      Id11 = null;
                                      Id12 = null;
                                      Id13 = null;
                                    });
                                  }),
                            ),
                          ),
                          Container(
                            height: size.height * .06,
                            width: size.width * .35,
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
                                    'ارسال',
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
                                    if (listId1 != null &&
                                        listId2 != null &&
                                        listId3 != null &&
                                        listId4 != null &&
                                        listId5 != null &&
                                        listId6 != null &&
                                        listId7 != null &&
                                        listId8 != null &&
                                        listId9 != null &&
                                        listId10 != null &&
                                        listId22 != null &&
                                        Id1.text != '' &&
                                        Id2.text != '' &&
                                        Id2.text != '' &&
                                        Id3.text != '' &&
                                        Id4.text != '' &&
                                        Id5.text != '' &&
                                        Id6.text != '' &&
                                        Id7.text != '' &&
                                        Id8.text != '' &&
                                        Id11 != null &&
                                        Id12 != null &&
                                        Id13 != null) {
                                      String a0 =
                                          '${snapshot.data.result.lableList[0].lebalId}."$listId1"';
                                      String a1 =
                                          '${snapshot.data.result.lableList[1].lebalId}."${Id1.text}"';
                                      String a2 =
                                          '${snapshot.data.result.lableList[2].lebalId}."${Id2.text}"';
                                      String a3 =
                                          '${snapshot.data.result.lableList[3].lebalId}."${Id3.text}"';
                                      String a4 =
                                          '${snapshot.data.result.lableList[4].lebalId}."${Id4.text}"';
                                      String a5 =
                                          '${snapshot.data.result.lableList[5].lebalId}."${Id5.text}"';
                                      String a6 =
                                          '${snapshot.data.result.lableList[6].lebalId}."${Id6.text}"';
                                      String a7 =
                                          '${snapshot.data.result.lableList[7].lebalId}."${Id7.text}"';
                                      String a8 =
                                          '${snapshot.data.result.lableList[8].lebalId}."${Id8.text}"';
                                      String a9 =
                                          '${snapshot.data.result.lableList[9].lebalId}."${Id9.text}"';
                                      String a10 =
                                          '${snapshot.data.result.lableList[10].lebalId}."${Id10.text}"';
                                      String a11 =
                                          "${snapshot.data.result.lableList[11].lebalId}.$Id11";
                                      String a12 =
                                          "${snapshot.data.result.lableList[12].lebalId}.$Id12";
                                      String a13 =
                                          "${snapshot.data.result.lableList[13].lebalId}.$Id13";
                                      String a14 =
                                          "${snapshot.data.result.lableList[14].lebalId}.$listId2";
                                      String a15 =
                                          "${snapshot.data.result.lableList[15].lebalId}.$listId3";
                                      String a16 =
                                          "${snapshot.data.result.lableList[16].lebalId}.$listId4";
                                      String a17 =
                                          "${snapshot.data.result.lableList[17].lebalId}.$listId5";
                                      String a18 =
                                          "${snapshot.data.result.lableList[18].lebalId}.$listId6";
                                      String a19 =
                                          "${snapshot.data.result.lableList[19].lebalId}.$listId8";
                                      String a20 =
                                          "${snapshot.data.result.lableList[20].lebalId}.$listId9";
                                      String a21 =
                                          "${snapshot.data.result.lableList[21].lebalId}.$listId10";
                                      String a22 =
                                          "${snapshot.data.result.lableList[22].lebalId}.$listId22";
                                      String answer =
                                          '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12,$a13,$a14,$a15,$a16,$a17,$a18,$a19,$a20,$a21,$a22';
                                      _repo
                                          .sendCostBuildF(
                                        key: '1234567890',
                                        token_id: widget.jwt,
                                        cat_id: widget.cat_id,
                                        answer: "$answer",
                                      )
                                          .then((value) {
                                        if (value.status == true) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => SendDone()));
                                        } else {
                                          var snackBar = SnackBar(
                                              content: Text(
                                                  'حدث خطأ يرجي اعادة المحاولة '));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      });
                                    } else {
                                      var snackBar = SnackBar(
                                          content: Text(
                                              'من فضلك ادخل جميع البيانات صحيحة '));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height * .06,
                            width: size.width * .55,
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
                                    'الرجوع للقائمة الرئيسية',
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => HomeBar()));
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),

//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: sHeight*.05,
//                           width: sWidth*.9,
//                           child: Text(
//                             "تقوم الشركة بعمل الاختبارات الهندسية للخرسانة الصلبة و الطازجة و كذالك اختبارات التربة و المجسات و الرفع المساحي و التقارير الهندسية اللازمة لها ",
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               fontFamily: 'GE SS Two',
//                               fontSize: 17,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: Container(
//                               child: DropdownButton<String>(
//                                 hint: Text(
//                                   'نوع الخدمة المطلوبة',
//                                   style: TextStyle(fontFamily: 'Cairo'),
//                                 ),
//                                 value: dropdownValue1,
//                                 isExpanded: true,
//                                 elevation: 30,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                                 onChanged: (String newValue) {
//                                   setState(() {
//                                     dropdownValue1 = newValue;
//                                   });
//                                 },
//                                 items: <String>[
//                                   'نوع الخدمة المطلوبة',
//                                   'item1',
//                                   'item2',
//                                   'item3',
//                                 ].map<DropdownMenuItem<String>>((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Container(
//                                         width: size.width * .7,
//                                         alignment: Alignment.centerRight,
//                                         child: Text(
//                                           value,
//                                           textDirection: TextDirection.rtl,
//                                           style: TextStyle(
//                                             fontFamily: 'GE SS Two',
//                                             fontSize: 17,
//                                             color: const Color(0xff848484),
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         )),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //1&2
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           width: sWidth * .4,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: sWidth * .05,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       IconButton(
//                                         icon: Icon(Icons.keyboard_arrow_up_outlined),
//                                         onPressed: () {
//                                           _increment();
//                                           print(_counter1);
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon:
//                                         Icon(Icons.keyboard_arrow_down_outlined),
//                                         onPressed: () {
//                                           _dicrement();
//                                           print(_counter1);
//                                         },
//                                       )
//                                     ],
//                                   )),
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .1,
//                                   height: sWidth * .1,
//                                   child: Center(child: Text("$_counter1"))),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "عمر المبني ",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: sWidth * .4,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width: sWidth * .05,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       IconButton(
//                                         icon: Icon(Icons.keyboard_arrow_up_outlined),
//                                         onPressed: () {
//                                           _increment2();
//                                           print(_counter2);
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon:
//                                         Icon(Icons.keyboard_arrow_down_outlined),
//                                         onPressed: () {
//                                           _dicrement2();
//                                           print(_counter2);
//                                         },
//                                       )
//                                     ],
//                                   )),
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .1,
//                                   height: sWidth * .1,
//                                   child: Center(child: Text("$_counter2"))),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "عدد الطوابق",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //country
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           width: sWidth * .4,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .2,
//                                   height: sWidth * .1,
//                                   child: Center(child: TextField())),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "المنطقة",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: sWidth * .4,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .2,
//                                   height: sWidth * .1,
//                                   child: Center(child: TextField())),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "المدينة",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
// //area
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: sWidth * .9,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   child: Text(
//                                     "مترمربع",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .37,
//                                   child: Center(child: TextField())),
//                               Container(
//                                   width: sWidth * .4,
//                                   child: Text(
//                                     "المساحة  التقديرية للمبني",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//
//                   //google
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: sWidth * .9,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .5,
//                                   child: Center(child: TextField())),
//                               Container(
//                                   width: sWidth * .23,
//                                   child: Text(
//                                     "وصلة موقع جوجل",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //exam
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: sWidth * .9,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   width: sWidth * .5,
//                                   child: Center(child: TextField())),
//                               Container(
//                                   width: sWidth * .25,
//                                   child: Text(
//                                     "الغرض من الاختبار",
//                                     style: TextStyle(
//                                       fontFamily: 'GE SS Two',
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   //   radio_btn
//
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: sWidth * .3,
//                                 child: ListTile(
//                                   title: const Text('لا'),
//                                   leading: Radio<SingingCharacter>(
//                                     value: SingingCharacter.no,
//                                     groupValue: _character1,
//                                     onChanged: (SingingCharacter value) {
//                                       setState(() {
//                                         _character1 = value;
//                                         print(_character1);
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: sWidth * .32,
//                                 child: ListTile(
//                                   title: const Text('نعم'),
//                                   leading: Radio<SingingCharacter>(
//                                     value: SingingCharacter.yes,
//                                     groupValue: _character1,
//                                     onChanged: (SingingCharacter value) {
//                                       setState(() {
//                                         _character1 = value;
//                                         print(_character1);
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                             width: sWidth * .2,
//                             child: Text(
//                               "مطلوب تقرير فني مع نتائج الاختبار",
//                               textDirection: TextDirection.rtl,
//                               style: TextStyle(
//                                 fontFamily: 'GE SS Two',
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ))
//                       ],
//                     ),
//                   ),
//
// ////////////////
//
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: GestureDetector(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text("ارفاق  ملف ",
//                               textDirection: TextDirection.rtl,
//                               style: TextStyle(
//                                 fontFamily: 'GE SS Two',
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               )),
//                           Icon(
//                             Icons.attach_file,
//                             size: 35,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: sWidth * .9,
//                           height: sHeight * .11,
//                           decoration: BoxDecoration(
//                               color: Colors.black12,
//                               borderRadius: BorderRadius.circular(10)),
//                           //  alignment: Alignment.center,
//                           child: TextField(
//                               decoration: InputDecoration(hintText: "ملاحظات",hintTextDirection: TextDirection.rtl),
//                               maxLines: 5,
//                               textDirection: TextDirection.rtl,
//                               style: TextStyle(
//                                 fontFamily: 'GE SS Two',
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w300,
//                               )),
//                         ),
//
//                       ],
//                     ),
//                   ),
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
