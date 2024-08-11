import 'package:delta/DataModel/FormsModels/cost_buildM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../draw.dart';
import 'Real_estate_investment.dart';
import 'send_done.dart';

class ConcreteStructure extends StatefulWidget {
  String? cat_id;
  String? jwt;

  @override
  _ConcreteStructureState createState() => _ConcreteStructureState();

  ConcreteStructure({this.cat_id, this.jwt});
}

enum SingingCharacter { yes, no }

class _ConcreteStructureState extends State<ConcreteStructure> {
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController aboveAreaController = TextEditingController();
  TextEditingController upCountController = TextEditingController();
  TextEditingController stairsCountController = TextEditingController();
  TextEditingController neighborController = TextEditingController();
  TextEditingController workersController = TextEditingController();
  TextEditingController elevatorsNumController = TextEditingController();
  TextEditingController floorsNumController = TextEditingController();

  var dropdownValue1 = 'نوع البناء';
  var dropdownValue2 = 'العمالة';
  var dropdownValue3 = 'جودة العمل';
  var dropdownValue4 = 'نوع الخشب';
  var dropdownValue5 = 'حالة الخشب';
  var dropdownValue6 = 'نوع القواعد';
  var dropdownValue7 = 'نوع الحوائط';
  num _counter1 = 0;
  num _counter2 = 0;

  var baseurl = 'https://mdecco.com/app/';
  List?_list0;
  int? id0;
  List?_list1;
  int? id1;
  List?_list2;
  int? id2;
  List?_list3;
  int? id3;
  List?_list4;
  int? id4;
  List?_list5;
  int? id5;
  List?_list6;
  int? id6;
  List?_list7;
  int? id7;
  List?_list8;
  int? id8;
  List?_list9;
  int? id9;
  List?_list10;
  int? id10;
  List?_list11;
  int? id11;
  List?_list12;
  int? id12;
  List?_list13;
  int? id13;
  Dio dio = Dio();

  Future<BuildCostM?> getCostBuildF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    BuildCostM? data;
    FormData formData = new FormData.fromMap(
        {"key": "1234567890", "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_commissioning_estimate',
      data: formData,
    )
        .then((value) {
      print('doneccccccccccccccccccccc');
      print(value);
      data = BuildCostM.fromMap(value.data);
    });
    setState(() {
      _list0 = data?.result?.lableList?[0].listAnwser?.toList();
      _list1 = data?.result?.lableList?[1].listAnwser?.toList();
      _list2 = data?.result?.lableList?[2].listAnwser?.toList();
      _list3 = data?.result?.lableList?[3].listAnwser?.toList();
      _list4 = data?.result?.lableList?[4].listAnwser?.toList();
      _list5 = data?.result?.lableList?[5].listAnwser?.toList();
      _list6 = data?.result?.lableList?[6].listAnwser?.toList();
      _list7 = data?.result?.lableList?[7].listAnwser?.toList();
      _list8 = data?.result?.lableList?[8].listAnwser?.toList();
      _list9 = data?.result?.lableList?[9].listAnwser?.toList();
      _list10 = data?.result?.lableList?[10].listAnwser?.toList();
      _list11 = data?.result?.lableList?[11].listAnwser?.toList();
      _list12 = data?.result?.lableList?[12].listAnwser?.toList();
      _list13 = data?.result?.lableList?[13].listAnwser?.toList();
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

  String? token;

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
        key: '1234567890', token_id: widget.jwt??"", cat_id: widget.cat_id);
    print(widget.jwt);
    print(widget.cat_id);
    super.initState();
  }

  Color? _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return null;
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
              .getCostBuildF(
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
                        "${snapshot.data?.result?.categoryDate?.title}",
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
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${snapshot.data?.result?.categoryDate?.title}",
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
                      // if (snapshot.data?.result?.categoryDate?.description?.isNotEmpty)
                      if (snapshot.data?.result?.categoryDate?.description!=null)

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
                                    "${snapshot.data?.result?.categoryDate?.description}",
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
                                  "${snapshot.data?.result?.lableList?[0].title}",
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
                                      snapshot.data?.result?.lableList?[0].type ==
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
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id0.text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[1].title}",
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
                                      snapshot.data?.result?.lableList?[1].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: workersController,
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
                                                      child: _list1 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list1
                                                                  ?.map((e) {
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
                                                                              17,
                                                                          color:
                                                                              const Color(-384871238),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      )),
                                                                  value: e.answerId,
                                                                );
                                                              }).toList(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  Id1 .text = val.toString();
                                                                  print(
                                                                      'This Id1');
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data?.result?.lableList?[2].title}",
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
                                      snapshot.data?.result?.lableList?[2].type ==
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
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id2 .text = val.toString();

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
                                  "${snapshot.data?.result?.lableList?[3].title}",
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
                                      snapshot.data?.result?.lableList?[3].type ==
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
                                                      child: _list3 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list3
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id3 .text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[4].title}",
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
                                      snapshot.data?.result?.lableList?[4].type ==
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
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id4.text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[5].title}",
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
                                      snapshot.data?.result?.lableList?[5].type ==
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
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id5.text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[6].title}",
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
                                      snapshot.data?.result?.lableList?[6].type ==
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
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id6 .text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[7].title}",
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
                                      snapshot.data?.result?.lableList?[7].type ==
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
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id7.text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[8].title}",
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
                                      snapshot.data?.result?.lableList?[8].type ==
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
                                                      child: _list8 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list8
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id8 .text = val.toString();
                                                                  print(Id8
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id8,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data?.result?.lableList?[9].title}",
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
                                      snapshot.data?.result?.lableList?[9].type ==
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
                                                      child: _list9 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list9
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id9 .text = val.toString();
                                                                  print(Id9
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id9,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${snapshot.data?.result?.lableList?[10].title}",
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
                                      snapshot.data?.result?.lableList?[10].type ==
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
                                                      child: _list10 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list10
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id10.text = val.toString();
                                                                  print(Id10
                                                                      .toString());
                                                                });
                                                              },
                                                              value: Id10,
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
                                  "${snapshot.data?.result?.lableList?[11].title}",
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
                                      snapshot.data?.result?.lableList?[11].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                controller: cityController,
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
                                                      child: _list11 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list11
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id11.text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[12].title}",
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
                                      snapshot.data?.result?.lableList?[12].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    elevatorsNumController,
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
                                                      child: _list13 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list12
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id12.text = val.toString();
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
                                  "${snapshot.data?.result?.lableList?[13].title}",
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
                                      snapshot.data?.result?.lableList?[13].type ==
                                              2
                                          ? Container(
                                              width: sWidth * .8,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: floorsNumController,
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
                                                      child: _list13 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list13
                                                                  ?.map((e) {
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
                                                                              17,
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
                                                                  Id13.text = val.toString();
                                                                  print(Id13
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
                      // if (snapshot.data?.result?.categoryDate?.details.isNotEmpty)

                        if (snapshot.data?.result?.categoryDate?.details!=null)

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: sWidth * .8,

                            //  alignment: Alignment.center,
                            child: Text(
                                "${snapshot.data?.result?.categoryDate?.details}",
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
                                      backgroundColor: Color(0xfff3a005), // Button background color
                                      foregroundColor: Colors.orangeAccent, // Button text color
                                      // primary: Color(0xfff3a005),
                                      // onPrimary: Colors.orangeAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Id0.text = '';
                                        // Id1 = null;
                                        Id2.text = '';
                                        Id3.text = '';
                                        Id4.text = '';
                                        Id5.text = '';
                                        Id6.text = '';
                                        Id7.text = '';
                                        Id8.text = '';
                                        Id9.text = '';
                                        Id10.text = '';
                                        Id11.text= '';
                                        // Id12 = null;

                                        Id13.text= '';
                                        cityController.text = '';
                                        floorsNumController.text = '';
                                        elevatorsNumController.text = '';
                                        workersController.text = '';
                                        // stateController.text = '';
                                        // aboveAreaController.text = '';
                                        // upCountController.text = '';
                                        // stairsCountController.text = '';
                                        // neighborController.text = '';
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
                                      backgroundColor: Color(0xfff3a005), // Button background color
                                      foregroundColor: Colors.orangeAccent, // Button text color
                                      //
                                      // primary: Color(0xfff3a005),
                                      // onPrimary: Colors.orangeAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    onPressed: () {
                                      if (Id0 != null &&
                                          (workersController.text != '' &&
                                              workersController.text != null) &&
                                          (snapshot.data?.result?.lableList?[2]
                                                      .type !=
                                                  2 &&
                                              Id2 != null) &&
                                          // Id2 != null&&
                                          Id3 != null &&
                                          Id4 != null &&
                                          Id5 != null &&
                                          Id6 != null &&
                                          Id7 != null &&
                                          Id10 != null &&
                                          // Id11 != null &&
                                          cityController.text != null &&
                                          cityController.text != "" &&
                                          elevatorsNumController.text != null &&
                                          elevatorsNumController.text != '' &&
                                          floorsNumController.text != null &&
                                          floorsNumController.text != '') {
                                        String a0 =
                                            "${snapshot.data?.result?.lableList?[0].lebalId}.$Id0";
                                        String a1 = snapshot.data?.result?.lableList?[1].type !=
                                                2
                                            ? "${snapshot.data?.result?.lableList?[1].lebalId}.$Id1"
                                            : '${snapshot.data?.result?.lableList?[1].lebalId}."${workersController.text}"';
                                        String a2 =
                                            "${snapshot.data?.result?.lableList?[2].lebalId}.$Id2";
                                        String a3 =
                                            "${snapshot.data?.result?.lableList?[3].lebalId}.$Id3";
                                        String a4 =
                                            "${snapshot.data?.result?.lableList?[4].lebalId}.$Id4";
                                        String a5 =
                                            "${snapshot.data?.result?.lableList?[5].lebalId}.$Id5";
                                        String a6 =
                                            "${snapshot.data?.result?.lableList?[6].lebalId}.$Id6";
                                        String a7 =
                                            "${snapshot.data?.result?.lableList?[7].lebalId}.$Id7";
                                        String a8 =
                                            "${snapshot.data?.result?.lableList?[8].lebalId}.$Id8";
                                        String a9 =
                                            "${snapshot.data?.result?.lableList?[9].lebalId}.$Id9";
                                        String a10 =
                                            "${snapshot.data?.result?.lableList?[10].lebalId}.$Id10";
                                        String a11 = snapshot.data?.result
                                                    ?.lableList?[11].type !=
                                                2
                                            ? "${snapshot.data?.result?.lableList?[11].lebalId}.$Id11"
                                            : '${snapshot.data?.result?.lableList?[11].lebalId}.\"${cityController.text}\"';
                                        String a12 = snapshot.data?.result
                                                    ?.lableList?[12].type !=
                                                2
                                            ? "${snapshot.data?.result?.lableList?[12].lebalId}.$Id12"
                                            : '${snapshot.data?.result?.lableList?[12].lebalId}."${elevatorsNumController.text}"';
                                        String a13 =
                                            '${snapshot.data?.result?.lableList?[13].lebalId}."${floorsNumController.text}"';

                                        print('a0==>$a0');
                                        print('a1==>$a1');
                                        print('a2==>$a2');
                                        print('a3==>$a3');
                                        print('a4==>$a4');
                                        print('a5==>$a5');
                                        print('a6==>$a6');
                                        print('a7==>$a7');
                                        print('a8==>$a8');
                                        print('a9==>$a9');
                                        print('a10==>$a10');
                                        print('a11==>$a11');
                                        print('a12==>$a12');
                                        print('a13==>$a13');
                                        print(
                                            'floorsNumController==>${floorsNumController.text}');
                                        print(
                                            'elevatorsNumController==>${elevatorsNumController.text}');
                                        // print('a14==>$a14');
                                        String answer =
                                            '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12'
                                            // '$a15,$a16,$a17,$a18,$a19'

                                            ;
                                        print('answer $answer');
                                        _repo
                                            .sendCostBuildF(
                                          key: '1234567890',
                                          token_id: widget.jwt,
                                          cat_id: widget.cat_id,
                                          answer: "$answer",
                                          space: workersController.text,
                                          elevators:
                                              elevatorsNumController.text,
                                          floors: floorsNumController.text,
                                        )
                                            .then((value) {
                                          if (value.status == true) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => SendDone(
                                                          message:
                                                              value.message,
                                                        )));
                                          } else {
                                            print(value.message);
                                            var snackBar = SnackBar(
                                                content: Text(
                                                    'حدث خطأ يرجي اعادة المحاولة '));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        });
                                      } else {
                                        print('Id0 ${Id0}');
                                        print('Id1 ${Id1}');
                                        print('Id2 ${Id2}');
                                        print('Id3 ${Id3}');
                                        print('Id4 ${Id4}');
                                        print('Id5 ${Id5}');
                                        print('Id6 ${Id6}');
                                        print('Id7 ${Id7}');
                                        print('Id8 ${Id8}');
                                        print('Id9 ${Id9}');
                                        print('Id10 ${Id10}');
                                        print('Id11 ${Id11}');
                                        print(
                                            'cityController.text ${cityController.text}');
                                        // print('stateController.text ${stateController.text}');
                                        // print('aboveAreaController.text ${aboveAreaController.text}');
                                        // print('upCountController.text ${upCountController.text}');
                                        // print('stairsCountController.text  ${stairsCountController.text }');
                                        // print('neighborController.text  ${neighborController.text}');
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
                                      backgroundColor: Color(0xfff3a005), // Button background color
                                      foregroundColor: Colors.orangeAccent, // Button text color

                                      // primary: Color(0xfff3a005),
                                      // onPrimary: Colors.orangeAccent,
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
