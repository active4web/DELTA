import 'dart:io';

import 'package:delta/DataModel/FormsModels/commerial_designM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Real_estate_investment.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import '../send_done.dart';

class CommercialDesign extends StatefulWidget {
  String? jwt;
  String? cat_id;
  String? message;

  @override
  _CommercialDesignState createState() => _CommercialDesignState();

  CommercialDesign({this.jwt, this.cat_id, this.message});
}

enum SingingCharacterTrade { no, yes }

SingingCharacterTrade _character_Trade = SingingCharacterTrade.yes;

enum SingingCharacterSpecialGate { no, yes }

SingingCharacterSpecialGate _character_SpecialGate =
    SingingCharacterSpecialGate.yes;

enum SingingCharacterParkingLoc { up, under }

SingingCharacterParkingLoc _character_ParkingLoc =
    SingingCharacterParkingLoc.up;

enum SingingCharacterParking { no, yes }

SingingCharacterParking _character_Parking = SingingCharacterParking.yes;

enum SingingCharacterLoc { yes, no }

SingingCharacterLoc _character_Loc = SingingCharacterLoc.yes;

enum SingingCharacterContainBuild { wedding_halls, meeting_rooms, Classrooms }

SingingCharacterContainBuild _character_ContainBuild =
    SingingCharacterContainBuild.wedding_halls;

enum SingingCharacterfloors { under, up }

SingingCharacterfloors _character_floors = SingingCharacterfloors.under;

List<String> houseTypes = ["انشائي", "معماري"];
var houseType;

enum SingingCharacterFlats { yes, no }

SingingCharacterFlats _character_Flats = SingingCharacterFlats.yes;

num _counter_serviceElevator = 0;
num _counter_usersElevator = 0;
num _counter_workers = 0;
num _counter_users = 0;
num _counter_floors = 0;
num _counter_flats = 0;
num _counter_workersElevator = 0;

class _CommercialDesignState extends State<CommercialDesign> {
  void _increment_serviceElevator() {
    setState(() {
      _counter_serviceElevator++;
    });
  }

  void _dicrement_serviceElevator() {
    setState(() {
      _counter_serviceElevator--;
    });
  }

  void _increment_usersElevator() {
    setState(() {
      _counter_usersElevator++;
    });
  }

  void _dicrement_usersElevator() {
    setState(() {
      _counter_usersElevator--;
    });
  }

  void _increment_floors() {
    setState(() {
      _counter_floors++;
    });
  }

  void _dicrement_floors() {
    setState(() {
      _counter_floors--;
    });
  }

  void _increment_workers() {
    setState(() {
      _counter_workers++;
    });
  }

  void _dicrement_workers() {
    setState(() {
      _counter_workers--;
    });
  }

  void _increment_users() {
    setState(() {
      _counter_users++;
    });
  }

  void _dicrement_users() {
    setState(() {
      _counter_users--;
    });
  }

  void _increment_flats() {
    setState(() {
      _counter_flats++;
    });
  }

  void _dicrement_flats() {
    setState(() {
      _counter_flats--;
    });
  }

  void _increment_workersElevator() {
    setState(() {
      _counter_workersElevator++;
    });
  }

  void _dicrement_bedroom() {
    setState(() {
      _counter_workersElevator--;
    });
  }

  Map<String, bool> values = {
    'حجرة خفير': false,
    'حجرة كهرباء': false,
    'حجرة ميكانيكا': false,
    'لوندريا': false,
    'كافيتيريا': false,
    'مصلي': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  String? token;

  Future<String?> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  List<File>? proFile;

  Future<void> openG() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      proFile = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    gettoken();
    super.initState();
    this.getCommercialServiceF(
        key: '1234567890', token_id: widget.jwt!, cat_id: widget.cat_id);
  }

  List? _list0;
  int? id0;
  List? _list1;
  int? id1;
  List? _list2;
  int? id2;
  List? _list3;
  int? id3;
  List? _list4;
  int? id4;
  List? _list10;
  int? id10;
  List? _list11;
  int? id11;
  List? _list12;
  int? id12;
  List? _list13;
  int? id13;
  List? _list19;
  int? id19;
  List? _list21;
  int? id21;
  List? _list20;
  int? answer20;
  List? _list31;
  int? answer31;
  List? _list22;
  int? id22;
  List? _list23;
  int? id23;
  List? _list24;
  int? id24;
  List? _list26;
  int? id26;
  List? _list27;
  int? id27;
  List? _list28;
  int? id28;
  TextEditingController Id5 = TextEditingController();
  TextEditingController Id6 = TextEditingController();
  TextEditingController Id7 = TextEditingController();
  TextEditingController Id8 = TextEditingController();
  TextEditingController Id9 = TextEditingController();
  TextEditingController Id14 = TextEditingController();
  TextEditingController Id15 = TextEditingController();
  TextEditingController Id16 = TextEditingController();
  TextEditingController Id17 = TextEditingController();
  TextEditingController Id19 = TextEditingController();
  TextEditingController Id20 = TextEditingController();
  TextEditingController Id21 = TextEditingController();
  TextEditingController Id22 = TextEditingController();
  TextEditingController Id24 = TextEditingController();
  TextEditingController Id26 = TextEditingController();
  TextEditingController Id28 = TextEditingController();
  Dio dio = Dio();
  Repository _repo = Repository();
  var baseurl = 'https://mdecco.com/app/';

  //getCommercialServiceF
  Future<CommercialDesignM?>? getCommercialServiceF({
    required String key,
    required String token_id,
    required String? cat_id,
  }) async {
    CommercialDesignM? data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_commercial_service',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = CommercialDesignM.fromMap(value.data);
    });
    setState(() {
      _list3 = data?.result?.lableList?[2].listAnwser?.toList();
      _list4 = data?.result?.lableList?[1].listAnwser?.toList();
      _list2 = data?.result?.lableList?[2].listAnwser?.toList();
      _list1 = data?.result?.lableList?[1].listAnwser?.toList();
      _list0 = data?.result?.lableList?[0].listAnwser?.toList();
      _list10 = data?.result?.lableList?[10].listAnwser?.toList();
      _list11 = data?.result?.lableList?[11].listAnwser?.toList();
      _list12 = data?.result?.lableList?[12].listAnwser?.toList();
      _list13 = data?.result?.lableList?[13].listAnwser?.toList();
      _list19 = data?.result?.lableList?[19].listAnwser?.toList();
      _list20 = data?.result?.lableList?[20].listAnwser?.toList();
      _list21 = data?.result?.lableList?[21].listAnwser?.toList();
      _list22 = data?.result?.lableList?[22].listAnwser?.toList();
      _list23 = data?.result?.lableList?[23].listAnwser?.toList();
      _list24 = data?.result?.lableList?[24].listAnwser?.toList();
      _list26 = data?.result?.lableList?[26].listAnwser?.toList();
      _list27 = data?.result?.lableList?[27].listAnwser?.toList();
      _list28 = data?.result?.lableList?[28].listAnwser?.toList();
      _list31 = data?.result?.lableList?[13].listAnwser?.toList();
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<CommercialDesignM>(
          stream: _repo
              .getCommercialServiceF(
                  key: '1234567890',
                  token_id: widget.jwt??"",
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
                          padding: const EdgeInsets.all(15.0),
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
                                    "نوع المبني",
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
                                  child: Padding(
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
                                              child: DropdownButton(
                                                isExpanded: true,
                                                items: houseTypes.map((e) {
                                                  return new DropdownMenuItem(
                                                    child: Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: new Text(
                                                          e,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'GE SS Two',
                                                            fontSize: 17,
                                                            color: const Color(
                                                                -384871238),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        )),
                                                    value: e.toString(),
                                                  );
                                                }).toList(),
                                                onChanged: (val) {
                                                  setState(() {
                                                    houseType = val;
                                                    print(houseType);
                                                  });
                                                },
                                                value: houseType,
                                              )),
                                        )
                                      ],
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
                                    "${snapshot.data?.result?.lableList?[0].title}",
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
                                    child: snapshot.data?.result?.lableList?[0]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list0 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list0?.map((e) {
                                                              return new DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child:
                                                                            new Text(
                                                                          "e.title",
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
                        //01
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
                                    child: snapshot.data?.result?.lableList?[1]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                                                Id1.text = val.toString();
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
                        //02
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
                                    child: snapshot.data?.result?.lableList?[2]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                                                Id2.text = val.toString();
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
                        //03
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
                                    child: snapshot.data?.result?.lableList?[3]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                                Id3.text = val.toString();
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
                        //04
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
                                    child: snapshot.data?.result?.lableList?[4]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${snapshot.data?.result?.lableList?[5].title}",
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
                                    child: snapshot.data?.result?.lableList?[5]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id5,
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
                                    "${snapshot.data?.result?.lableList?[6].title}",
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
                                    child: snapshot.data?.result?.lableList?[6]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id6,
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
                                    "${snapshot.data?.result?.lableList?[7].title}",
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
                                    child: snapshot.data?.result?.lableList?[7]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id7,
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
                                    "${snapshot.data?.result?.lableList?[8].title}",
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
                                    child: snapshot.data?.result?.lableList?[8]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id8,
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
                                    "${snapshot.data?.result?.lableList?[9].title}",
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
                                    child: snapshot.data?.result?.lableList?[9]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id9,
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
                                    child: snapshot.data?.result?.lableList?[10]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                    child: snapshot.data?.result?.lableList?[11]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                    child: snapshot.data?.result?.lableList?[12]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              // controller: workersController,
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list12 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list12
                                                                ?.map((e) {
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
                                    child: snapshot.data?.result?.lableList?[13]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                    "${snapshot.data?.result?.lableList?[19].title}",
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
                                    child: snapshot.data?.result?.lableList?[19]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list19 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list19
                                                                ?.map((e) {
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
                                                                value: e.answerId,
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                Id19.text = val.toString();
                                                                print(Id19.toString());
                                                              });
                                                            },
                                                            value: Id19,
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
                                    "${snapshot.data?.result?.lableList?[20].title}",
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
                                    child: snapshot.data?.result?.lableList?[20]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list20 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list20
                                                                ?.map((e) {
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
                                                                answer20 = int.parse(val.toString());
                                                                print(answer20
                                                                    .toString());
                                                              });
                                                            },
                                                            value: answer20,
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
                                    "${snapshot.data?.result?.lableList?[21].title}",
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
                                    child: snapshot.data?.result?.lableList?[21]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list21 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list21
                                                                ?.map((e) {
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
                                                                Id21.text = val.toString();
                                                                print(Id21
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id21,
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
                                    "${snapshot.data?.result?.lableList?[22].title}",
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
                                    child: snapshot.data?.result?.lableList?[22]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list22 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list22
                                                                ?.map((e) {
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
                                                                Id22.text= val.toString();
                                                                // print(Id22
                                                                //     .toString());
                                                              });
                                                            },
                                                            value: Id22,
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
                                    "${snapshot.data?.result?.lableList?[23].title}",
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
                                    child: snapshot.data?.result?.lableList?[23]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list23 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list23
                                                                ?.map((e) {
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
                                                                Id23.text = val.toString();
                                                                print(Id23
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id23,
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
                                    "${snapshot.data?.result?.lableList?[24].title}",
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
                                    child: snapshot.data?.result?.lableList?[24]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list24 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list24
                                                                ?.map((e) {
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
                                                                Id24.text = val.toString();
                                                                print(Id24
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id24,
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
                                    "${snapshot.data?.result?.lableList?[26].title}",
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
                                    child: snapshot.data?.result?.lableList?[26]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list26 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list26
                                                                ?.map((e) {
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
                                                                Id26.text = val.toString();
                                                                print(Id26
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id26,
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
                                    "${snapshot.data?.result?.lableList?[27].title}",
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
                                    child: snapshot.data?.result?.lableList?[27]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list27 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list27
                                                                ?.map((e) {
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
                                                                Id27.text = val.toString();
                                                                print(Id27
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id27,
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
                                    "${snapshot.data?.result?.lableList?[28].title}",
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
                                    child: snapshot.data?.result?.lableList?[28]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list28 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list28
                                                                ?.map((e) {
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
                                                                Id28.text = val.toString();
                                                                print(Id28
                                                                    .toString());
                                                              });
                                                            },
                                                            value: Id28,
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
                                    "${snapshot.data?.result?.lableList?[14].title}",
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
                                    child: snapshot.data?.result?.lableList?[14]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id14,
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
                                    "${snapshot.data?.result?.lableList?[15].title}",
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
                                    child: snapshot.data?.result?.lableList?[15]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: Id15,
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
                                    "${snapshot.data?.result?.lableList?[16].title}",
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
                                    child: snapshot.data?.result?.lableList?[16]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                controller: Id16,
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
                                    "${snapshot.data?.result?.lableList?[25].title}",
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
                                    child: snapshot.data?.result?.lableList?[25]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                controller: Id16,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                            ))
                                        : GestureDetector(
                                            onTap: () {
                                              openG();
                                              print(proFile);
                                            },
                                            child: Container(
                                              child: Icon(
                                                Icons.attach_file,
                                                size: 35,
                                              ),
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
                                    child: snapshot.data?.result?.lableList?[13]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
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
                                                    child: _list31 != null
                                                        ? DropdownButton(
                                                            isExpanded: true,
                                                            items: _list31
                                                                ?.map((e) {
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
                                                                answer31 = int.parse(val.toString());
                                                                print(answer31
                                                                    .toString());
                                                              });
                                                            },
                                                            value: answer31,
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
                                        foregroundColor: Colors.orangeAccent,
                                        // primary: Color(0xfff3a005),
                                        // onPrimary: Colors.orangeAccent,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Id5.text = '';
                                          Id6.text = '';
                                          Id7.text = '';
                                          Id8.text = '';
                                          Id9.text = '';
                                          Id14.text = '';
                                          Id15.text = '';
                                          Id16.text = '';
                                          Id17.text = '';
                                          proFile = null;
                                          Id0.text = '';
                                          Id1.text = '';
                                          Id2.text = '';
                                          Id3.text = '';
                                          Id4.text = '';
                                          Id10.text = '';
                                          Id11.text = '';
                                          Id12.text = '';
                                          Id13.text = '';
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
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      onPressed: () {
                                        if (Id5.text != '' &&
                                            Id6.text != '' &&
                                            Id7.text != '' &&
                                            Id8.text != '' &&
                                            Id9.text != '' &&
                                            Id14.text != '' &&
                                            Id15.text != '' &&
                                            Id16.text != '' &&
                                            Id0 != null &&
                                            Id1 != null &&
                                            Id2 != null &&
                                            Id3 != null &&
                                            Id4 != null &&
                                            Id10 != null &&
                                            Id11 != null &&
                                            Id12 != null &&
                                            Id13 != null) {
                                          String a0 =
                                              "${snapshot.data?.result?.lableList?[0].lebalId}.$Id0";
                                          String a1 =
                                              "${snapshot.data?.result?.lableList?[1].lebalId}.$Id1";
                                          String a2 =
                                              "${snapshot.data?.result?.lableList?[2].lebalId}.$Id2";
                                          String a3 =
                                              "${snapshot.data?.result?.lableList?[3].lebalId}.$Id3";
                                          String a4 =
                                              "${snapshot.data?.result?.lableList?[4].lebalId}.$Id4";
                                          String a5 =
                                              '${snapshot.data?.result?.lableList?[5].lebalId}."${Id5.text}"';
                                          String a6 =
                                              '${snapshot.data?.result?.lableList?[6].lebalId}."${Id6.text}"';
                                          String a7 =
                                              '${snapshot.data?.result?.lableList?[7].lebalId}."${Id7.text}"';
                                          String a8 =
                                              '${snapshot.data?.result?.lableList?[8].lebalId}."${Id8.text}"';
                                          String a9 =
                                              '${snapshot.data?.result?.lableList?[9].lebalId}."${Id9.text}"';
                                          String a10 =
                                              "${snapshot.data?.result?.lableList?[10].lebalId}.$Id10";
                                          String a11 =
                                              "${snapshot.data?.result?.lableList?[11].lebalId}.$Id11";
                                          String a12 =
                                              "${snapshot.data?.result?.lableList?[12].lebalId}.$Id12";
                                          String a13 =
                                              "${snapshot.data?.result?.lableList?[13].lebalId}.$Id13";
                                          String a14 =
                                              '${snapshot.data?.result?.lableList?[9].lebalId}."${Id14.text}"';
                                          String a15 =
                                              '${snapshot.data?.result?.lableList?[15].lebalId}."${Id15.text}"';
                                          String a16 =
                                              '${snapshot.data?.result?.lableList?[16].lebalId}."${Id16.text}"';
                                          String a19 =
                                              '${snapshot.data?.result?.lableList?[19].lebalId}."$Id19"';
                                          String a20 =
                                              '${snapshot.data?.result?.lableList?[20].lebalId}.$answer20';
                                          String a21 =
                                              '${snapshot.data?.result?.lableList?[21].lebalId}."$Id21"';
                                          String a22 =
                                              '${snapshot.data?.result?.lableList?[22].lebalId}."$Id22"';
                                          String a23 =
                                              '${snapshot.data?.result?.lableList?[23].lebalId}."$Id23"';
                                          String a24 =
                                              '${snapshot.data?.result?.lableList?[24].lebalId}."$Id24"';
                                          String a26 =
                                              '${snapshot.data?.result?.lableList?[26].lebalId}."$Id26"';
                                          String a27 =
                                              '${snapshot.data?.result?.lableList?[27].lebalId}."$Id27"';
                                          String a28 =
                                              '${snapshot.data?.result?.lableList?[28].lebalId}."$Id28"';
                                          String a29 =
                                              '${snapshot.data?.result?.lableList?[13].lebalId}."$answer31"';
                                          String answer =
                                              '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12,$a13,$a14,$a15,$a16,$a19,$a20,$a21,$a22,$a23,$a24,$a26,$a27,$a28,$a29,';
                                          _repo
                                              .sendCostBuildF(
                                            key: '1234567890',
                                            token_id: widget.jwt,
                                            cat_id: widget.cat_id,
                                            file: proFile,
                                            answer: "$answer",
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
                                        foregroundColor: Colors.orangeAccent,
                                        backgroundColor: Color(0xfff3a005),
                                        elevation: 20,
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
                  ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
