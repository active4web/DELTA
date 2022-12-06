import 'dart:developer';

import 'package:delta/DataModel/FormsModels/cost_buildM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../draw.dart';
import 'send_done.dart';

class BuildingCostFinishKey extends StatefulWidget {
  BuildingCostFinishKey({Key key, this.cat_id, this.jwt}) : super(key: key);
  String cat_id;
  String jwt;

  @override
  _BuildingCostFinishKeyState createState() => _BuildingCostFinishKeyState();
}

enum SingingCharacter { yes, no }

class _BuildingCostFinishKeyState extends State<BuildingCostFinishKey> {
  TextEditingController areaController = TextEditingController();
  TextEditingController bedRoomNumberController = TextEditingController();
  TextEditingController resipitionController = TextEditingController();
  TextEditingController kitchenController = TextEditingController();
  TextEditingController bathRoomNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController EmailAddressController = TextEditingController();
  // TextEditingController neighborController = TextEditingController();

  var dropdownValue1 = 'نوع البناء';
  var dropdownValue2 = 'العمالة';
  var dropdownValue3 = 'جودة العمل';
  var dropdownValue4 = 'نوع الخشب';
  var dropdownValue5 = 'حالة الخشب';
  var dropdownValue6 = 'نوع القواعد';
  num _counter1 = 0;
  num _counter2 = 0;

  var baseurl = 'https://mdecco.com/app/';
  List _list0;
  int Id0;
  List _list1;
  int Id1;
  List _list2;
  int Id2;
  List _list3;
  int Id3;
  List _list4;
  int Id4;
  List _list5;
  int Id5;
  List _list6;
  int Id6;
  List _list7;
  int Id7;
  // List _list8;
  // int Id8;
  // List _list9;
  // int Id9;
  // List _list10;
  // int Id10;
  // List _list11;
  // int Id11;
  // List _list12;
  // int Id12;
  // List _list13;
  // int Id13;
  Dio dio = Dio();

  Future<BuildCostM> getCostBuildF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    BuildCostM data;
    FormData formData = new FormData.fromMap(
        {"key": "1234567890", "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_buildingcostfinishKey',
      data: formData,
    )
        .then((value) {
      print('doneccccccccccccccccccccc');
      print(value);
      data = BuildCostM.fromMap(value.data);
    });
    setState(() {
      _list0 = data.result.lableList[0].listAnwser.toList();
      _list1 = data.result.lableList[1].listAnwser.toList();
      _list2 = data.result.lableList[2].listAnwser.toList();
      _list3 = data.result.lableList[3].listAnwser.toList();
      _list4 = data.result.lableList[4].listAnwser.toList();
      _list5 = data.result.lableList[5].listAnwser.toList();
      _list6 = data.result.lableList[6].listAnwser.toList();
      _list7 = data.result.lableList[7].listAnwser.toList();
    });
    return data;
  }

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

  SingingCharacter _character1 = SingingCharacter.yes;
  SingingCharacter _character2 = SingingCharacter.yes;
  SingingCharacter _character3 = SingingCharacter.yes;
  SingingCharacter _character4 = SingingCharacter.yes;
  SingingCharacter _character5 = SingingCharacter.yes;
  SingingCharacter _character6 = SingingCharacter.yes;

  String token;
  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }

  @override
  void initState() {
    token = "";
    this.gettoken();
    this.getCostBuildF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
    print(widget.jwt);
    print(widget.cat_id);
    super.initState();
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

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<BuildCostM>(
          stream: _repo
              .getBuildingCostFinishedKey(
                  key: '1234567890', token_id: token, cat_id: widget.cat_id)
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
                endDrawer: NewWidget(size: size, token: token),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[0].title}",
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
                                      snapshot.data.result.lableList[0].type ==
                                              2
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
                                                      child: _list0 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list0
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id0 = val;
                                                                  print(Id0
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id0,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${snapshot.data.result.lableList[1].title}",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Color(0xffaa6414),
                                      fontFamily: 'GE SS Two',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child:
                                        snapshot.data.result.lableList[1]
                                                    .type ==
                                                2
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        width: size.width * .8,
                                                        child: _list1 != null
                                                            ? DropdownButton(
                                                                isExpanded:
                                                                    true,
                                                                items: _list1
                                                                    .map((e) {
                                                                  return new DropdownMenuItem(
                                                                    child: Container(
                                                                        alignment: Alignment.centerRight,
                                                                        child: new Text(
                                                                          e.title,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'GE SS Two',
                                                                            fontSize:
                                                                                11,
                                                                            color:
                                                                                const Color(-384871238),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                        )),
                                                                    value: e
                                                                        .answerId,
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    Id1 = val;
                                                                    print(Id1
                                                                        .toString());
                                                                  });
                                                                },
                                                                value: Id1,
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
                          )),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[2].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child:
                                      snapshot.data.result.lableList[2].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                // controller: workersController,
                                                textDirection:
                                                    TextDirection.rtl,
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
                                                      child: _list2 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list2
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id2 = val;
                                                                  print(Id2
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id2,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[3].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child:
                                      snapshot.data.result.lableList[3].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                // controller: workersController,
                                                textDirection:
                                                    TextDirection.rtl,
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
                                                      child: _list2 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list3
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id3 = val;
                                                                  print(Id3
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id3,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[4].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child:
                                      snapshot.data.result.lableList[4].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                // controller: workersController,
                                                textDirection:
                                                    TextDirection.rtl,
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
                                                      child: _list4 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list4
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id4 = val;
                                                                  print(Id4
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id4,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[5].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child:
                                      snapshot.data.result.lableList[5].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                // controller: workersController,
                                                textDirection:
                                                    TextDirection.rtl,
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
                                                      child: _list5 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list5
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id5 = val;
                                                                  print(Id5
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id5,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[6].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child:
                                      snapshot.data.result.lableList[6].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                // controller: workersController,
                                                textDirection:
                                                    TextDirection.rtl,
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
                                                      child: _list6 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list6
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id6 = val;
                                                                  print(Id6
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id6,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[7].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child:
                                      snapshot.data.result.lableList[7].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                // controller: workersController,
                                                textDirection:
                                                    TextDirection.rtl,
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
                                                              items: _list7
                                                                  .map((e) {
                                                                return new DropdownMenuItem(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: new Text(
                                                                        e.title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'GE SS Two',
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e
                                                                      .answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id7 = val;
                                                                  print(Id7
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id7,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data.result.lableList[8].title}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Color(0xffaa6414),
                                    fontFamily: 'GE SS Two',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    child: snapshot.data.result.lableList[8]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              controller: areaController,
                                              textDirection: TextDirection.rtl,
                                            ))
                                        : null),
                              )
                            ],
                          ),
                        ),
                      ),
                      //9
                      // Card(
                      //   elevation: 15,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(14)),
                      //   child: Container(
                      //     width: sWidth * .95,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "${snapshot.data.result.lableList[9].title}",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               color: Color(0xffaa6414),
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             child:
                      //                 snapshot.data.result.lableList[9].type ==
                      //                         2
                      //                     ? Container(
                      //                         width: sWidth * .8,
                      //                         child: TextField(
                      //                           // controller: workersController,
                      //                           textDirection:
                      //                               TextDirection.rtl,
                      //                         ))
                      //                     : Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 5.0, bottom: 8.0),
                      //                         child: Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               decoration: BoxDecoration(
                      //                                 border: Border(),
                      //                               ),
                      //                               height: 50,
                      //                               width: size.width * .8,
                      //                               child: Container(
                      //                                 decoration: BoxDecoration(
                      //                                   color: Colors.white,
                      //                                 ),
                      //                                 width: size.width * .8,
                      //                                 child: _list9 != null
                      //                                     ? DropdownButton(
                      //                                         isExpanded: true,
                      //                                         items: _list9
                      //                                             .map((e) {
                      //                                           return new DropdownMenuItem(
                      //                                             child: Container(
                      //                                                 alignment: Alignment.centerRight,
                      //                                                 child: new Text(
                      //                                                   e.title,
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     fontFamily:
                      //                                                         'GE SS Two',
                      //                                                     fontSize:
                      //                                                         17,
                      //                                                     color:
                      //                                                         const Color(-384871238),
                      //                                                     fontWeight:
                      //                                                         FontWeight.w300,
                      //                                                   ),
                      //                                                   textDirection:
                      //                                                       TextDirection.rtl,
                      //                                                 )),
                      //                                             value: e
                      //                                                 .answerId,
                      //                                           );
                      //                                         }).toList(),
                      //                                         onChanged: (val) {
                      //                                           setState(() {
                      //                                             Id9 = val;
                      //                                             print(Id9
                      //                                                 .toString());
                      //                                           });
                      //                                         },
                      //                                         value: Id9,
                      //                                       )
                      //                                     : Container(),
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // //10
                      // Card(
                      //   elevation: 15,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(14)),
                      //   child: Container(
                      //     width: sWidth * .95,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "${snapshot.data.result.lableList[10].title}",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               color: Color(0xffaa6414),
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             child:
                      //                 snapshot.data.result.lableList[10].type ==
                      //                         2
                      //                     ? Container(
                      //                         width: sWidth * .8,
                      //                         child: TextField(
                      //                           // controller: workersController,
                      //                           textDirection:
                      //                               TextDirection.rtl,
                      //                         ))
                      //                     : Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 5.0, bottom: 8.0),
                      //                         child: Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               decoration: BoxDecoration(
                      //                                 border: Border(),
                      //                               ),
                      //                               height: 50,
                      //                               width: size.width * .8,
                      //                               child: Container(
                      //                                 decoration: BoxDecoration(
                      //                                   color: Colors.white,
                      //                                 ),
                      //                                 width: size.width * .8,
                      //                                 child: _list10 != null
                      //                                     ? DropdownButton(
                      //                                         isExpanded: true,
                      //                                         items: _list10
                      //                                             .map((e) {
                      //                                           return new DropdownMenuItem(
                      //                                             child: Container(
                      //                                                 alignment: Alignment.centerRight,
                      //                                                 child: new Text(
                      //                                                   e.title,
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     fontFamily:
                      //                                                         'GE SS Two',
                      //                                                     fontSize:
                      //                                                         17,
                      //                                                     color:
                      //                                                         const Color(-384871238),
                      //                                                     fontWeight:
                      //                                                         FontWeight.w300,
                      //                                                   ),
                      //                                                   textDirection:
                      //                                                       TextDirection.rtl,
                      //                                                 )),
                      //                                             value: e
                      //                                                 .answerId,
                      //                                           );
                      //                                         }).toList(),
                      //                                         onChanged: (val) {
                      //                                           setState(() {
                      //                                             Id10 = val;
                      //                                             print(Id10
                      //                                                 .toString());
                      //                                           });
                      //                                         },
                      //                                         value: Id10,
                      //                                       )
                      //                                     : Container(),
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // //11
                      // Card(
                      //   elevation: 15,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(14)),
                      //   child: Container(
                      //     width: sWidth * .95,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "${snapshot.data.result.lableList[11].title}",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               color: Color(0xffaa6414),
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             child:
                      //                 snapshot.data.result.lableList[11].type ==
                      //                         2
                      //                     ? Container(
                      //                         width: sWidth * .8,
                      //                         child: TextField(
                      //                           // controller: workersController,
                      //                           textDirection:
                      //                               TextDirection.rtl,
                      //                         ))
                      //                     : Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 5.0, bottom: 8.0),
                      //                         child: Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               decoration: BoxDecoration(
                      //                                 border: Border(),
                      //                               ),
                      //                               height: 50,
                      //                               width: size.width * .8,
                      //                               child: Container(
                      //                                 decoration: BoxDecoration(
                      //                                   color: Colors.white,
                      //                                 ),
                      //                                 width: size.width * .8,
                      //                                 child: _list11 != null
                      //                                     ? DropdownButton(
                      //                                         isExpanded: true,
                      //                                         items: _list11
                      //                                             .map((e) {
                      //                                           return new DropdownMenuItem(
                      //                                             child: Container(
                      //                                                 alignment: Alignment.centerRight,
                      //                                                 child: new Text(
                      //                                                   e.title,
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     fontFamily:
                      //                                                         'GE SS Two',
                      //                                                     fontSize:
                      //                                                         17,
                      //                                                     color:
                      //                                                         const Color(-384871238),
                      //                                                     fontWeight:
                      //                                                         FontWeight.w300,
                      //                                                   ),
                      //                                                   textDirection:
                      //                                                       TextDirection.rtl,
                      //                                                 )),
                      //                                             value: e
                      //                                                 .answerId,
                      //                                           );
                      //                                         }).toList(),
                      //                                         onChanged: (val) {
                      //                                           setState(() {
                      //                                             Id11 = val;
                      //                                             print(Id11
                      //                                                 .toString());
                      //                                           });
                      //                                         },
                      //                                         value: Id11,
                      //                                       )
                      //                                     : Container(),
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // //12
                      // Card(
                      //   elevation: 15,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(14)),
                      //   child: Container(
                      //     width: sWidth * .95,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "${snapshot.data.result.lableList[12].title}",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               color: Color(0xffaa6414),
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             child:
                      //                 snapshot.data.result.lableList[12].type ==
                      //                         2
                      //                     ? Container(
                      //                         width: sWidth * .8,
                      //                         child: TextField(
                      //                           // controller: workersController,
                      //                           textDirection:
                      //                               TextDirection.rtl,
                      //                         ))
                      //                     : Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 5.0, bottom: 8.0),
                      //                         child: Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               decoration: BoxDecoration(
                      //                                 border: Border(),
                      //                               ),
                      //                               height: 50,
                      //                               width: size.width * .8,
                      //                               child: Container(
                      //                                 decoration: BoxDecoration(
                      //                                   color: Colors.white,
                      //                                 ),
                      //                                 width: size.width * .8,
                      //                                 child: _list12 != null
                      //                                     ? DropdownButton(
                      //                                         isExpanded: true,
                      //                                         items: _list12
                      //                                             .map((e) {
                      //                                           return new DropdownMenuItem(
                      //                                             child: Container(
                      //                                                 alignment: Alignment.centerRight,
                      //                                                 child: new Text(
                      //                                                   e.title,
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     fontFamily:
                      //                                                         'GE SS Two',
                      //                                                     fontSize:
                      //                                                         17,
                      //                                                     color:
                      //                                                         const Color(-384871238),
                      //                                                     fontWeight:
                      //                                                         FontWeight.w300,
                      //                                                   ),
                      //                                                   textDirection:
                      //                                                       TextDirection.rtl,
                      //                                                 )),
                      //                                             value: e
                      //                                                 .answerId,
                      //                                           );
                      //                                         }).toList(),
                      //                                         onChanged: (val) {
                      //                                           setState(() {
                      //                                             Id12 = val;
                      //                                             print(Id12
                      //                                                 .toString());
                      //                                           });
                      //                                         },
                      //                                         value: Id12,
                      //                                       )
                      //                                     : Container(),
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // //13
                      // Card(
                      //   elevation: 15,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(14)),
                      //   child: Container(
                      //     width: sWidth * .95,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "${snapshot.data.result.lableList[13].title}",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               color: Color(0xffaa6414),
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             child:
                      //                 snapshot.data.result.lableList[13].type ==
                      //                         2
                      //                     ? Container(
                      //                         width: sWidth * .8,
                      //                         child: TextField(
                      //                           // controller: workersController,
                      //                           textDirection:
                      //                               TextDirection.rtl,
                      //                         ))
                      //                     : Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 5.0, bottom: 8.0),
                      //                         child: Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               decoration: BoxDecoration(
                      //                                 border: Border(),
                      //                               ),
                      //                               height: 50,
                      //                               width: size.width * .8,
                      //                               child: Container(
                      //                                 decoration: BoxDecoration(
                      //                                   color: Colors.white,
                      //                                 ),
                      //                                 width: size.width * .8,
                      //                                 child: _list13 != null
                      //                                     ? DropdownButton(
                      //                                         isExpanded: true,
                      //                                         items: _list13
                      //                                             .map((e) {
                      //                                           return new DropdownMenuItem(
                      //                                             child: Container(
                      //                                                 alignment: Alignment.centerRight,
                      //                                                 child: new Text(
                      //                                                   e.title,
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     fontFamily:
                      //                                                         'GE SS Two',
                      //                                                     fontSize:
                      //                                                         17,
                      //                                                     color:
                      //                                                         const Color(-384871238),
                      //                                                     fontWeight:
                      //                                                         FontWeight.w300,
                      //                                                   ),
                      //                                                   textDirection:
                      //                                                       TextDirection.rtl,
                      //                                                 )),
                      //                                             value: e
                      //                                                 .answerId,
                      //                                           );
                      //                                         }).toList(),
                      //                                         onChanged: (val) {
                      //                                           setState(() {
                      //                                             Id13 = val;
                      //                                             print(Id13
                      //                                                 .toString());
                      //                                           });
                      //                                         },
                      //                                         value: Id13,
                      //                                       )
                      //                                     : Container(),
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
//text
                      //14
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
                                    child: snapshot.data.result.lableList[9]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller:
                                                    bedRoomNumberController,
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
                      //15
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
                                  child: snapshot
                                              .data.result.lableList[10].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              controller: resipitionController,
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
                      //16
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
                                  "${snapshot.data.result.lableList[11].title}",
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
                                              .data.result.lableList[11].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              controller: kitchenController,
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
                                  "${snapshot.data.result.lableList[14].title}",
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
                                              .data.result.lableList[14].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              controller:
                                                  bathRoomNumberController,
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
                      //17
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
                                  "${snapshot.data.result.lableList[12].title}",
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
                                              .data.result.lableList[12].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              controller: phoneNumberController,
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
                                  "${snapshot.data.result.lableList[13].title}",
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
                                              .data.result.lableList[13].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller:
                                                  EmailAddressController,
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

                      //19
                      // Card(
                      //   elevation: 15,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(14)),
                      //   child: Container(
                      //     width: sWidth * .95,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(5.0),
                      //           child: Text(
                      //             "${snapshot.data.result.lableList[19].title}",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               color: Color(0xffaa6414),
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(5.0),
                      //           child: Container(
                      //             child: snapshot
                      //                         .data.result.lableList[19].type ==
                      //                     2
                      //                 ? Container(
                      //                     width: sWidth * .8,
                      //                     child: Container(
                      //                       child: TextField(
                      //                         controller: neighborController,
                      //                         textDirection: TextDirection.rtl,
                      //                       ),
                      //                     ))
                      //                 : Container()
                      //             // Padding(
                      //             //   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                      //             //   child: Row(
                      //             //     mainAxisAlignment: MainAxisAlignment.center,
                      //             //     children: [
                      //             //       Container(
                      //             //         decoration: BoxDecoration(
                      //             //           border: Border(),
                      //             //         ),
                      //             //         height: 50,
                      //             //         width: size.width * .8,
                      //             //         child: Container(
                      //             //           decoration: BoxDecoration(
                      //             //             color: Colors.white,
                      //             //           ),
                      //             //           width: size.width*.8,
                      //             //           child: _list15!=null?
                      //             //           DropdownButton(
                      //             //             isExpanded: true,
                      //             //             items: _list15.map((e) {
                      //             //               return new DropdownMenuItem(
                      //             //                 child: Container(
                      //             //                     alignment: Alignment.centerRight,
                      //             //                     child: new Text(
                      //             //                       e.title, style: TextStyle(
                      //             //                       fontFamily: 'GE SS Two',
                      //             //                       fontSize: 17,
                      //             //                       color: const Color(0xff848484),
                      //             //                       fontWeight: FontWeight.w300,
                      //             //                     ),textDirection: TextDirection.rtl,)
                      //             //
                      //             //                 ),
                      //             //                 value:  e.answerId,
                      //             //               );
                      //             //             }).toList(),
                      //             //             onChanged: (val){
                      //             //               setState(() {
                      //             //                 Id15=val;
                      //             //                 print(Id5.toString());
                      //             //               });
                      //             //             },value:Id5 ,
                      //             //           ):Container(),
                      //             //         ),)
                      //             //     ],
                      //             //   ),
                      //             // )
                      //             ,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      ///////////
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'نوع البناء',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue1,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue1 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'نوع البناء',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Flexible(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             width: sWidth * .4,
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'العمالة',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue2,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue2 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'العمالة',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Flexible(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             width: sWidth * .4,
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'جودة العمل',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue3,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue3 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'جودة العمل',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Flexible(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             width: sWidth * .4,
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'نوع الخشب',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue4,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue4 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'نوع الخشب',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Flexible(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             width: sWidth * .4,
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'حالة الخشب',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue5,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue5 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'حالة الخشب',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Flexible(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             width: sWidth * .4,
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'نوع القواعد',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue6,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue6 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'نوع القواعد',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Flexible(
                      //         child: Directionality(
                      //           textDirection: TextDirection.rtl,
                      //           child: Container(
                      //             width: sWidth * .4,
                      //             child: DropdownButton<String>(
                      //               hint: Text(
                      //                 'نوع الحوائط',
                      //                 style: TextStyle(fontFamily: 'Cairo'),
                      //               ),
                      //               value: dropdownValue7,
                      //               isExpanded: true,
                      //               elevation: 30,
                      //               style: TextStyle(
                      //                 color: Colors.grey,
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   dropdownValue7 = newValue;
                      //                 });
                      //               },
                      //               items: <String>[
                      //                 'نوع الحوائط',
                      //                 'item1',
                      //                 'item2',
                      //                 'item3',
                      //               ].map<DropdownMenuItem<String>>((String value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Container(
                      //                       width: size.width * .7,
                      //                       alignment: Alignment.centerRight,
                      //                       child: Text(
                      //                         value,
                      //                         textDirection: TextDirection.rtl,
                      //                         style: TextStyle(
                      //                           fontFamily: 'GE SS Two',
                      //                           fontSize: 17,
                      //                           color: const Color(0xff848484),
                      //                           fontWeight: FontWeight.w300,
                      //                         ),
                      //                       )),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Container(
                      //         width: sWidth * .4,
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Container(
                      //                 width: sWidth * .05,
                      //                 child: Column(
                      //                   mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: [
                      //                     IconButton(
                      //                       icon: Icon(Icons.keyboard_arrow_up_outlined),
                      //                       onPressed: () {
                      //                         _increment();
                      //                         print(_counter1);
                      //                       },
                      //                     ),
                      //                     IconButton(
                      //                       icon:
                      //                       Icon(Icons.keyboard_arrow_down_outlined),
                      //                       onPressed: () {
                      //                         _dicrement();
                      //                         print(_counter1);
                      //                       },
                      //                     )
                      //                   ],
                      //                 )),
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.grey,
                      //                     borderRadius: BorderRadius.circular(10)),
                      //                 width: sWidth * .1,
                      //                 height: sWidth * .1,
                      //                 child: Center(child: Text("$_counter1"))),
                      //             Container(
                      //                 width: sWidth * .2,
                      //                 child: Text(
                      //                   "عدد الطوابق",
                      //                   style: TextStyle(
                      //                     fontFamily: 'GE SS Two',
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.w300,
                      //                   ),
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         width: sWidth * .4,
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Container(
                      //                 width: sWidth * .05,
                      //                 child: Column(
                      //                   mainAxisAlignment: MainAxisAlignment.center,
                      //                   children: [
                      //                     IconButton(
                      //                       icon: Icon(Icons.keyboard_arrow_up_outlined),
                      //                       onPressed: () {
                      //                         _increment2();
                      //                         print(_counter1);
                      //                       },
                      //                     ),
                      //                     IconButton(
                      //                       icon:
                      //                       Icon(Icons.keyboard_arrow_down_outlined),
                      //                       onPressed: () {
                      //                         _dicrement2();
                      //                         print(_counter1);
                      //                       },
                      //                     )
                      //                   ],
                      //                 )),
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.grey,
                      //                     borderRadius: BorderRadius.circular(10)),
                      //                 width: sWidth * .1,
                      //                 height: sWidth * .1,
                      //                 child: Center(child: Text("$_counter2"))),
                      //             Container(
                      //                 width: sWidth * .2,
                      //                 child: Text(
                      //                   "عدد المصاعد",
                      //                   style: TextStyle(
                      //                     fontFamily: 'GE SS Two',
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.w300,
                      //                   ),
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Container(
                      //         width: sWidth * .4,
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.grey,
                      //                     borderRadius: BorderRadius.circular(10)),
                      //                 width: sWidth * .2,
                      //                 height: sWidth * .1,
                      //                 child: Center(child: TextField())),
                      //             Container(
                      //                 width: sWidth * .2,
                      //                 child: Text(
                      //                   "المنطقة",
                      //                   style: TextStyle(
                      //                     fontFamily: 'GE SS Two',
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.w300,
                      //                   ),
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         width: sWidth * .4,
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.grey,
                      //                     borderRadius: BorderRadius.circular(10)),
                      //                 width: sWidth * .2,
                      //                 height: sWidth * .1,
                      //                 child: Center(child: TextField())),
                      //             Container(
                      //                 width: sWidth * .2,
                      //                 child: Text(
                      //                   "المدينة",
                      //                   style: TextStyle(
                      //                     fontFamily: 'GE SS Two',
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.w300,
                      //                   ),
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         width: sWidth * .9,
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Container(
                      //                 child: Text(
                      //                   "مترمربع",
                      //                   style: TextStyle(
                      //                     fontFamily: 'GE SS Two',
                      //                     fontSize: 13,
                      //                     fontWeight: FontWeight.w300,
                      //                   ),
                      //                 )),
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.grey,
                      //                     borderRadius: BorderRadius.circular(10)),
                      //                 width: sWidth * .37,
                      //                 child: Center(child: TextField())),
                      //             Container(
                      //                 width: sWidth * .4,
                      //                 child: Text(
                      //                   "مساحة المسقوف الاجمالية",
                      //                   style: TextStyle(
                      //                     fontFamily: 'GE SS Two',
                      //                     fontSize: 13,
                      //                     fontWeight: FontWeight.w300,
                      //                   ),
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // //radio_btn
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: sWidth * .27,
                      //               child: ListTile(
                      //                 title: const Text('لا'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.no,
                      //                   groupValue: _character1,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character1 = value;
                      //                       print(_character1);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               width: sWidth * .3,
                      //               child: ListTile(
                      //                 title: const Text('نعم'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.yes,
                      //                   groupValue: _character1,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character1 = value;
                      //                       print(_character1);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           width: sWidth * .3,
                      //           child: Text(
                      //             "مهندس مقيم",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 17,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ))
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: sWidth * .27,
                      //               child: ListTile(
                      //                 title: const Text('لا'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.no,
                      //                   groupValue: _character2,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character2 = value;
                      //                       print(_character2);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               width: sWidth * .3,
                      //               child: ListTile(
                      //                 title: const Text('نعم'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.yes,
                      //                   groupValue: _character2,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character2 = value;
                      //                       print(_character2);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           width: sWidth * .3,
                      //           child: Text(
                      //             "مهندس زيارات مراحل",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ))
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: sWidth * .27,
                      //               child: ListTile(
                      //                 title: const Text('لا'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.no,
                      //                   groupValue: _character3,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character3 = value;
                      //                       print(_character3);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               width: sWidth * .3,
                      //               child: ListTile(
                      //                 title: const Text('نعم'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.yes,
                      //                   groupValue: _character3,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character3 = value;
                      //                       print(_character3);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           width: sWidth * .3,
                      //           child: Text(
                      //             "مطلوب تعديل خرائط",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ))
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: sWidth * .27,
                      //               child: ListTile(
                      //                 title: const Text('لا'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.no,
                      //                   groupValue: _character4,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character4 = value;
                      //                       print(_character4);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               width: sWidth * .3,
                      //               child: ListTile(
                      //                 title: const Text('نعم'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.yes,
                      //                   groupValue: _character4,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character4 = value;
                      //                       print(_character4);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           width: sWidth * .3,
                      //           child: Text(
                      //             " يوجد خرائط معمارية",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ))
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: sWidth * .27,
                      //               child: ListTile(
                      //                 title: const Text('لا'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.no,
                      //                   groupValue: _character5,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character5 = value;
                      //                       print(_character5);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               width: sWidth * .3,
                      //               child: ListTile(
                      //                 title: const Text('نعم'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.yes,
                      //                   groupValue: _character5,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character5 = value;
                      //                       print(_character5);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           width: sWidth * .3,
                      //           child: Text(
                      //             " يوجد خرائط انشائية",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ))
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: sWidth * .27,
                      //               child: ListTile(
                      //                 title: const Text('لا'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.no,
                      //                   groupValue: _character6,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character6 = value;
                      //                       print(_character6);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               width: sWidth * .3,
                      //               child: ListTile(
                      //                 title: const Text('نعم'),
                      //                 leading: Radio<SingingCharacter>(
                      //                   value: SingingCharacter.yes,
                      //                   groupValue: _character6,
                      //                   onChanged: (SingingCharacter value) {
                      //                     setState(() {
                      //                       _character6 = value;
                      //                       print(_character6);
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           width: sWidth * .3,
                      //           child: Text(
                      //             "يوجد خرائط كهربائية",
                      //             textDirection: TextDirection.rtl,
                      //             style: TextStyle(
                      //               fontFamily: 'GE SS Two',
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           ))
                      //     ],
                      //   ),
                      // ),
//////////////////
                      //

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
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
                                        Id0 = null;
                                        Id1 = null;
                                        Id2 = null;
                                        Id3 = null;
                                        Id4 = null;
                                        Id5 = null;
                                        Id6 = null;
                                        Id7 = null;
                                        areaController.text = '';
                                        bedRoomNumberController.text = '';
                                        bathRoomNumberController.text = '';
                                        kitchenController.text = '';
                                        resipitionController.text = '';
                                        EmailAddressController.text = '';
                                        phoneNumberController.text = '';
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
                                      if (Id0 != null &&
                                          Id1 != null &&
                                          Id2 != null &&
                                          Id3 != null &&
                                          Id4 != null &&
                                          Id5 != null &&
                                          Id6 != null &&
                                          Id7 != null &&
                                          bedRoomNumberController.text !=
                                              null &&
                                          bathRoomNumberController.text !=
                                              null &&
                                          kitchenController.text != null &&
                                          resipitionController.text != null &&
                                          areaController.text != null &&
                                          phoneNumberController.text != null &&
                                          EmailAddressController.text != null &&
                                          areaController.text != "" &&
                                          resipitionController.text != "" &&
                                          kitchenController.text != "" &&
                                          bathRoomNumberController.text != "" &&
                                          EmailAddressController.text != "" &&
                                          phoneNumberController.text != "" &&
                                          bedRoomNumberController.text != "") {
                                        String a0 =
                                            "${snapshot.data.result.lableList[0].lebalId}.$Id0";
                                        String a1 =
                                            "${snapshot.data.result.lableList[1].lebalId}.$Id1";
                                        String a2 =
                                            "${snapshot.data.result.lableList[2].lebalId}.$Id2";
                                        String a3 =
                                            "${snapshot.data.result.lableList[3].lebalId}.$Id3";
                                        String a4 =
                                            "${snapshot.data.result.lableList[4].lebalId}.$Id4";
                                        String a5 =
                                            "${snapshot.data.result.lableList[5].lebalId}.$Id5";
                                        String a6 =
                                            "${snapshot.data.result.lableList[6].lebalId}.$Id6";
                                        String a7 =
                                            "${snapshot.data.result.lableList[7].lebalId}.$Id7";
                                        String a8 =
                                            '${snapshot.data.result.lableList[8].lebalId}."${areaController.text}"';
                                        String a9 =
                                            '${snapshot.data.result.lableList[9].lebalId}."${bedRoomNumberController.text}"';
                                        String a10 =
                                            '${snapshot.data.result.lableList[10].lebalId}."${resipitionController.text}"';
                                        // String a11 =
                                        //     kitchenController.text;
                                        // String a12 =
                                        //     bathRoomNumberController.text;
                                        String a13 =
                                            '${snapshot.data.result.lableList[13].lebalId}."${phoneNumberController.text}"';
                                        String a14 =
                                            '${snapshot.data.result.lableList[12].lebalId}."${EmailAddressController.text}"';

                                        String answer =
                                            '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a13,$a14';

                                     String   st1 =kitchenController.text;
                                       String st2 = bathRoomNumberController.text;
                                        _repo
                                            .sendCostBuildF(
                                                key: '1234567890',
                                                token_id: widget.jwt,
                                                cat_id: widget.cat_id,
                                                answer: "$answer",
                                          st1: "$st1",
                                          st2 : "$st2"
                                        )
                                            .then((value) {
                                          if (value.status == true) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        SendDone(message: value.message))
                                            );

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
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

//Directionality
