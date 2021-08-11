import 'dart:io';

import 'package:delta/DataModel/FormsModels/commerial_designM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/DrawerNav/not_logged_in.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Home/order_track.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../draw.dart';
import '../login.dart';
import '../send_done.dart';
import 'package:delta/Screen/DrawerNav/about_app.dart';
import 'package:delta/Screen/DrawerNav/blogs.dart';
import 'package:delta/Screen/DrawerNav/contact_us.dart';
import 'package:delta/Screen/DrawerNav/notifications.dart';
import 'package:delta/Screen/Home/projectDetails.dart';
import 'package:delta/Screen/DrawerNav/profile.dart';
import 'package:delta/Screen/DrawerNav/technical_support.dart';

class CommercialDesign extends StatefulWidget {
  CommercialDesign({Key key, this.jwt, this.cat_id}) : super(key: key);
  String jwt;
  String cat_id;

  @override
  _CommercialDesignState createState() => _CommercialDesignState();
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

  String token;

  Future<String> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  List<File> proFile;

  Future<void> openG() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      proFile = result.paths.map((path) => File(path)).toList();
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    gettoken();
    super.initState();
    this.getCommercialServiceF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
  }

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
  List _list10;
  int Id10;
  List _list11;
  int Id11;
  List _list12;
  int Id12;
  List _list13;
  int Id13;
  TextEditingController Id5 = TextEditingController();
  TextEditingController Id6 = TextEditingController();
  TextEditingController Id7 = TextEditingController();
  TextEditingController Id8 = TextEditingController();
  TextEditingController Id9 = TextEditingController();
  TextEditingController Id14 = TextEditingController();
  TextEditingController Id15 = TextEditingController();
  TextEditingController Id16 = TextEditingController();
  TextEditingController Id17 = TextEditingController();
  Dio dio = Dio();
  Repository _repo = Repository();
  var baseurl = 'https://wasselni.ps/delta/';

  //getCommercialServiceF
  Future<CommercialDesignM> getCommercialServiceF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    CommercialDesignM data;
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
      _list3 = data.result.lableList[2].listAnwser.toList();
      _list4 = data.result.lableList[1].listAnwser.toList();
      _list2 = data.result.lableList[2].listAnwser.toList();
      _list1 = data.result.lableList[1].listAnwser.toList();
      _list0 = data.result.lableList[0].listAnwser.toList();
      _list10 = data.result.lableList[10].listAnwser.toList();
      _list11 = data.result.lableList[11].listAnwser.toList();
      _list12 = data.result.lableList[12].listAnwser.toList();
      _list13 = data.result.lableList[13].listAnwser.toList();
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
                                    "${snapshot.data.result.lableList[0].title}",
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
                                    child: snapshot.data.result.lableList[0]
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
                                                            items:
                                                                _list0.map((e) {
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
                                    child: snapshot.data.result.lableList[1]
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
                                                            items:
                                                                _list1.map((e) {
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
                                    child: snapshot.data.result.lableList[2]
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
                                    child: snapshot.data.result.lableList[3]
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
                                    child: snapshot.data.result.lableList[4]
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
                                    child: snapshot.data.result.lableList[5]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
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
                                    child: snapshot.data.result.lableList[6]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
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
                                    child: snapshot.data.result.lableList[7]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
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
                                    child: snapshot.data.result.lableList[8]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
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
                                    "${snapshot.data.result.lableList[10].title}",
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
                                    child: snapshot.data.result.lableList[10]
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
                                                                Id10 = val;
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
                                    "${snapshot.data.result.lableList[11].title}",
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
                                    child: snapshot.data.result.lableList[11]
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: snapshot.data.result.lableList[12]
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: snapshot.data.result.lableList[13]
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
                        /////////////xc zxczxczx////zxczxczxc
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
                                    child: snapshot.data.result.lableList[14]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
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
                                    "${snapshot.data.result.lableList[15].title}",
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
                                    child: snapshot.data.result.lableList[15]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
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
                                    "${snapshot.data.result.lableList[16].title}",
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
                                    child: snapshot.data.result.lableList[16]
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
                                    child: snapshot.data.result.lableList[13]
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
                                          )
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
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Container(
                        //         width: sWidth * .95,
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //                 child: Text(
                        //               "عرض",
                        //               style: TextStyle(
                        //                 fontFamily: 'GE SS Two',
                        //                 fontSize: 13,
                        //                 fontWeight: FontWeight.w300,
                        //               ),
                        //             )),
                        //             Container(
                        //                 decoration: BoxDecoration(
                        //                     color: Colors.grey,
                        //                     borderRadius: BorderRadius.circular(10)),
                        //                 width: sWidth * .15,
                        //                 child: Center(child: TextField())),
                        //             Container(
                        //                 child: Text(
                        //               "طول",
                        //               style: TextStyle(
                        //                 fontFamily: 'GE SS Two',
                        //                 fontSize: 13,
                        //                 fontWeight: FontWeight.w300,
                        //               ),
                        //             )),
                        //             Container(
                        //                 decoration: BoxDecoration(
                        //                     color: Colors.grey,
                        //                     borderRadius: BorderRadius.circular(10)),
                        //                 width: sWidth * .15,
                        //                 child: Center(child: TextField())),
                        //             Container(
                        //                 width: sWidth * .21,
                        //                 child: Text(
                        //                   "ابعاد الارض",
                        //                   style: TextStyle(
                        //                     fontFamily: 'GE SS Two',
                        //                     fontSize: 12,
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
                        //         width: sWidth * .5,
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           children: [
                        //             Container(
                        //                 child: Text(
                        //               "متر مربع",
                        //               style: TextStyle(
                        //                 fontFamily: 'GE SS Two',
                        //                 fontSize: 13,
                        //                 fontWeight: FontWeight.w300,
                        //               ),
                        //             )),
                        //             Container(
                        //                 decoration: BoxDecoration(
                        //                     color: Colors.grey,
                        //                     borderRadius: BorderRadius.circular(10)),
                        //                 width: sWidth * .25,
                        //                 child: Center(child: TextField())),
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //           width: sWidth * .27,
                        //           child: Text(
                        //             "مساحة المبني",
                        //             style: TextStyle(
                        //               fontFamily: 'GE SS Two',
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w300,
                        //             ),
                        //           )),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
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
                        //                       icon:
                        //                           Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_workers();
                        //                         print(_counter_workers);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_workers();
                        //                         print(_counter_workers);
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
                        //                 child: Center(child: Text("$_counter_workers"))),
                        //             Container(
                        //                 width: sWidth * .2,
                        //                 child: Text(
                        //                   "عدد العاملين",
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
                        //     mainAxisAlignment: MainAxisAlignment.end,
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
                        //                       icon:
                        //                           Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_users();
                        //                         print(_counter_users);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_users();
                        //                         print(_counter_users);
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
                        //                 child: Center(child: Text("$_counter_users"))),
                        //             Container(
                        //                 width: sWidth * .25,
                        //                 child: Text(
                        //                   "عدد المستخدمين ",
                        //                   textDirection: TextDirection.rtl,
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
                        //
                        // //trade
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Row(
                        //           children: [
                        //             Container(
                        //               width: sWidth * .3,
                        //               child: ListTile(
                        //                 title: const Text('لا'),
                        //                 leading: Radio<SingingCharacterTrade>(
                        //                   value: SingingCharacterTrade.no,
                        //                   groupValue: _character_Trade,
                        //                   onChanged: (SingingCharacterTrade value) {
                        //                     setState(() {
                        //                       _character_Trade = value;
                        //                       print(_character_Trade);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: sWidth * .33,
                        //               child: ListTile(
                        //                 title: const Text('نعم'),
                        //                 leading: Radio<SingingCharacterTrade>(
                        //                   value: SingingCharacterTrade.yes,
                        //                   groupValue: _character_Trade,
                        //                   onChanged: (SingingCharacterTrade value) {
                        //                     setState(() {
                        //                       _character_Trade = value;
                        //                       print(_character_Trade);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Container(
                        //             width: sWidth * .25,
                        //             child: Text(
                        //               "يحتوي عل محال تجارية",
                        //               textDirection: TextDirection.rtl,
                        //               style: TextStyle(
                        //                 fontFamily: 'GE SS Two',
                        //                 fontSize: 13,
                        //                 fontWeight: FontWeight.w300,
                        //               ),
                        //             )),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //
                        // //Contain
                        //
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               child: Container(
                        //                 // width: sWidth * .33,
                        //                 child: ListTile(
                        //                   title: const Text(
                        //                     'قاعات مناسبات',
                        //                     style: TextStyle(fontSize: 13),
                        //                   ),
                        //                   leading: Radio<SingingCharacterContainBuild>(
                        //                     value: SingingCharacterContainBuild
                        //                         .wedding_halls,
                        //                     groupValue: _character_ContainBuild,
                        //                     onChanged:
                        //                         (SingingCharacterContainBuild value) {
                        //                       setState(() {
                        //                         _character_ContainBuild = value;
                        //                         print(_character_ContainBuild);
                        //                       });
                        //                     },
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Expanded(
                        //               child: Container(
                        //                 //  width: sWidth * .33,
                        //                 child: ListTile(
                        //                   title: const Text('قاعات دراسيه',
                        //                       style: TextStyle(fontSize: 14)),
                        //                   leading: Radio<SingingCharacterContainBuild>(
                        //                     value:
                        //                         SingingCharacterContainBuild.Classrooms,
                        //                     groupValue: _character_ContainBuild,
                        //                     onChanged:
                        //                         (SingingCharacterContainBuild value) {
                        //                       setState(() {
                        //                         _character_ContainBuild = value;
                        //                         print(_character_ContainBuild);
                        //                       });
                        //                     },
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Expanded(
                        //               child: Container(
                        //                 //  width: sWidth * .33,
                        //                 child: ListTile(
                        //                   title: const Text(
                        //                     'قاعات اجتماعات',
                        //                     style: TextStyle(fontSize: 13),
                        //                   ),
                        //                   leading: Radio<SingingCharacterContainBuild>(
                        //                     value: SingingCharacterContainBuild
                        //                         .meeting_rooms,
                        //                     groupValue: _character_ContainBuild,
                        //                     onChanged:
                        //                         (SingingCharacterContainBuild value) {
                        //                       setState(() {
                        //                         _character_ContainBuild = value;
                        //                         print(_character_ContainBuild);
                        //                       });
                        //                     },
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // //parking
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //       width: sWidth * .6,
                        //       child: Text(
                        //         "يحتوي المبني علي موقف سيارات",
                        //         textDirection: TextDirection.rtl,
                        //         style: TextStyle(
                        //           fontFamily: 'GE SS Two',
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.w300,
                        //         ),
                        //       )),
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
                        //               width: sWidth * .3,
                        //               child: ListTile(
                        //                 title: const Text('لا'),
                        //                 leading: Radio<SingingCharacterParking>(
                        //                   value: SingingCharacterParking.no,
                        //                   groupValue: _character_Parking,
                        //                   onChanged: (SingingCharacterParking value) {
                        //                     setState(() {
                        //                       _character_Parking = value;
                        //                       print(_character_Parking);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: sWidth * .33,
                        //               child: ListTile(
                        //                 title: const Text('نعم'),
                        //                 leading: Radio<SingingCharacterParking>(
                        //                   value: SingingCharacterParking.yes,
                        //                   groupValue: _character_Parking,
                        //                   onChanged: (SingingCharacterParking value) {
                        //                     setState(() {
                        //                       _character_Parking = value;
                        //                       print(_character_Parking);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
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
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Row(
                        //           children: [
                        //             Container(
                        //               width: sWidth * .3,
                        //               child: ListTile(
                        //                 title: const Text('تحت الارض'),
                        //                 leading: Radio<SingingCharacterParkingLoc>(
                        //                   value: SingingCharacterParkingLoc.under,
                        //                   groupValue: _character_ParkingLoc,
                        //                   onChanged: (SingingCharacterParkingLoc value) {
                        //                     setState(() {
                        //                       _character_ParkingLoc = value;
                        //                       print(_character_ParkingLoc);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: sWidth * .35,
                        //               child: ListTile(
                        //                 title: const Text('فوق الارض'),
                        //                 leading: Radio<SingingCharacterParkingLoc>(
                        //                   value: SingingCharacterParkingLoc.up,
                        //                   groupValue: _character_ParkingLoc,
                        //                   onChanged: (SingingCharacterParkingLoc value) {
                        //                     setState(() {
                        //                       _character_ParkingLoc = value;
                        //                       print(_character_ParkingLoc);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //
                        // //floors
                        //
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Expanded(
                        //         child: Container(
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: <Widget>[
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Container(
                        //                       width: sWidth * .32,
                        //                       child: ListTile(
                        //                         title: const Text('فوق الارض'),
                        //                         leading: Radio<SingingCharacterfloors>(
                        //                           value: SingingCharacterfloors.up,
                        //                           groupValue: _character_floors,
                        //                           onChanged:
                        //                               (SingingCharacterfloors value) {
                        //                             setState(() {
                        //                               _character_floors = value;
                        //                               print(_character_floors);
                        //                             });
                        //                           },
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Container(
                        //                       width: sWidth * .32,
                        //                       child: ListTile(
                        //                         title: const Text('تحت الارض'),
                        //                         leading: Radio<SingingCharacterfloors>(
                        //                           value: SingingCharacterfloors.under,
                        //                           groupValue: _character_floors,
                        //                           onChanged:
                        //                               (SingingCharacterfloors value) {
                        //                             setState(() {
                        //                               _character_floors = value;
                        //                               print(_character_floors);
                        //                             });
                        //                           },
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //                 width: sWidth * .05,
                        //                 child: Column(
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   children: [
                        //                     IconButton(
                        //                       icon:
                        //                           Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_floors();
                        //                         print(_counter_floors);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_floors();
                        //                         print(_counter_floors);
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
                        //                 child: Center(child: Text("$_counter_floors"))),
                        //             Container(
                        //                 width: sWidth * .15,
                        //                 child: Text(
                        //                   "عدد الطوابق ",
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
                        //
                        // //special gate
                        //
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Row(
                        //           children: [
                        //             Container(
                        //               width: sWidth * .3,
                        //               child: ListTile(
                        //                 title: const Text('لا'),
                        //                 leading: Radio<SingingCharacterSpecialGate>(
                        //                   value: SingingCharacterSpecialGate.no,
                        //                   groupValue: _character_SpecialGate,
                        //                   onChanged: (SingingCharacterSpecialGate value) {
                        //                     setState(() {
                        //                       _character_SpecialGate = value;
                        //                       print(_character_SpecialGate);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: sWidth * .33,
                        //               child: ListTile(
                        //                 title: const Text('نعم'),
                        //                 leading: Radio<SingingCharacterSpecialGate>(
                        //                   value: SingingCharacterSpecialGate.yes,
                        //                   groupValue: _character_SpecialGate,
                        //                   onChanged: (SingingCharacterSpecialGate value) {
                        //                     setState(() {
                        //                       _character_SpecialGate = value;
                        //                       print(_character_SpecialGate);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Container(
                        //             width: sWidth * .25,
                        //             child: Text(
                        //               "مدخل خاص لطوابق معينه",
                        //               textDirection: TextDirection.rtl,
                        //               style: TextStyle(
                        //                 fontFamily: 'GE SS Two',
                        //                 fontSize: 13,
                        //                 fontWeight: FontWeight.w300,
                        //               ),
                        //             )),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //
                        // //residential flats
                        //
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Expanded(
                        //         child: Container(
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: <Widget>[
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Container(
                        //                       width: sWidth * .32,
                        //                       child: ListTile(
                        //                         title: const Text('لا'),
                        //                         leading: Radio<SingingCharacterFlats>(
                        //                           value: SingingCharacterFlats.no,
                        //                           groupValue: _character_Flats,
                        //                           onChanged:
                        //                               (SingingCharacterFlats value) {
                        //                             setState(() {
                        //                               _character_Flats = value;
                        //                               print(_character_Flats);
                        //                             });
                        //                           },
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Container(
                        //                       width: sWidth * .32,
                        //                       child: ListTile(
                        //                         title: const Text('نعم'),
                        //                         leading: Radio<SingingCharacterFlats>(
                        //                           value: SingingCharacterFlats.yes,
                        //                           groupValue: _character_Flats,
                        //                           onChanged:
                        //                               (SingingCharacterFlats value) {
                        //                             setState(() {
                        //                               _character_Flats = value;
                        //                               print(_character_Flats);
                        //                             });
                        //                           },
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //                 width: sWidth * .05,
                        //                 child: Column(
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   children: [
                        //                     IconButton(
                        //                       icon:
                        //                           Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_flats();
                        //                         print(_counter_flats);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_flats();
                        //                         print(_counter_flats);
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
                        //                 child: Center(child: Text("$_counter_flats"))),
                        //             Container(
                        //                 width: sWidth * .15,
                        //                 child: Text(
                        //                   "شقق سكنية ",
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
                        //
                        // Container(
                        //   child: ListView(
                        //     shrinkWrap: true,
                        //     children: values.keys.map((String key) {
                        //       return new CheckboxListTile(
                        //         title: new Text(key),
                        //         value: values[key],
                        //         activeColor: Color(0xff3b6745),
                        //         checkColor: Colors.white,
                        //         onChanged: (bool value) {
                        //           setState(() {
                        //             values[key] = value;
                        //           });
                        //         },
                        //       );
                        //     }).toList(),
                        //   ),
                        // ),
                        // RaisedButton(
                        //   child: Text(
                        //     " تأكيد الاختيارات ",
                        //     style: TextStyle(fontSize: 18),
                        //   ),
                        //   onPressed: getCheckboxItems,
                        //   color: Color(0xff3b6745),
                        //   textColor: Colors.white,
                        //   splashColor: Colors.grey,
                        //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        // ),
                        //
                        // //comerUp
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
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
                        //                       icon:
                        //                           Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_serviceElevator();
                        //                         print(_counter_serviceElevator);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_serviceElevator();
                        //                         print(_counter_serviceElevator);
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
                        //                 child: Center(child: Text("$_counter_serviceElevator"))),
                        //             Container(
                        //                 width: sWidth * .2,
                        //                 child: Text(
                        //                   "عدد المصاعد الخدمية ",
                        //                   style: TextStyle(
                        //                     fontFamily: 'GE SS Two',
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w300,
                        //                   ),
                        //                 )),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //
                        // //usersUp
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
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
                        //                       icon:
                        //                           Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_usersElevator();
                        //                         print(_counter_usersElevator);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_usersElevator();
                        //                         print(_counter_usersElevator);
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
                        //                 child: Center(child: Text("$_counter_usersElevator"))),
                        //             Container(
                        //                 width: sWidth * .2,
                        //                 child: Text(
                        //                   "عدد مصاعد المستخدمين ",
                        //                   style: TextStyle(
                        //                     fontFamily: 'GE SS Two',
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w300,
                        //                   ),
                        //                 )),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //
                        // //workers
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
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
                        //                       icon:
                        //                       Icon(Icons.keyboard_arrow_up_outlined),
                        //                       onPressed: () {
                        //                         _increment_workersElevator();
                        //                         print(_counter_workersElevator);
                        //                       },
                        //                     ),
                        //                     IconButton(
                        //                       icon: Icon(
                        //                           Icons.keyboard_arrow_down_outlined),
                        //                       onPressed: () {
                        //                         _dicrement_bedroom();
                        //                         print(_counter_workersElevator);
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
                        //                 child: Center(child: Text("$_counter_workersElevator"))),
                        //             Container(
                        //                 width: sWidth * .2,
                        //                 child: Text(
                        //                   "عدد مصاعد العاملين ",
                        //                   style: TextStyle(
                        //                     fontFamily: 'GE SS Two',
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w300,
                        //                   ),
                        //                 )),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Row(
                        //           children: [
                        //             Container(
                        //               width: sWidth * .3,
                        //               child: ListTile(
                        //                 title: const Text('لا'),
                        //                 leading: Radio<SingingCharacterLoc>(
                        //                   value: SingingCharacterLoc.no,
                        //                   groupValue: _character_Loc,
                        //                   onChanged: (SingingCharacterLoc value) {
                        //                     setState(() {
                        //                       _character_Loc = value;
                        //                       print(_character_Loc);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: sWidth * .33,
                        //               child: ListTile(
                        //                 title: const Text('نعم'),
                        //                 leading: Radio<SingingCharacterLoc>(
                        //                   value: SingingCharacterLoc.yes,
                        //                   groupValue: _character_Loc,
                        //                   onChanged: (SingingCharacterLoc value) {
                        //                     setState(() {
                        //                       _character_Loc = value;
                        //                       print(_character_Loc);
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Container(
                        //             width: sWidth * .25,
                        //             child: Text(
                        //               "ارفاق كروكي الموقع",
                        //               textDirection: TextDirection.rtl,
                        //               style: TextStyle(
                        //                 fontFamily: 'GE SS Two',
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.w300,
                        //               ),
                        //             )),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //
                        // Padding(
                        //   padding: const EdgeInsets.all(3.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         width: sWidth * .85,
                        //         height: sHeight * .15,
                        //         decoration: BoxDecoration(
                        //             color: Colors.black12,
                        //             borderRadius: BorderRadius.circular(10)),
                        //         //  alignment: Alignment.center,
                        //         child: TextField(
                        //             decoration: InputDecoration(hintText: "تكلم عن الوظائف  و الفراغات المطلوبة",hintTextDirection: TextDirection.rtl),
                        //             maxLines: 7,
                        //             textDirection: TextDirection.rtl,
                        //             style: TextStyle(
                        //               fontFamily: 'GE SS Two',
                        //               fontSize: 17,
                        //               fontWeight: FontWeight.w300,
                        //             )),
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),

                        //btn
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
                                          Id0 = null;
                                          Id1 = null;
                                          Id2 = null;
                                          Id3 = null;
                                          Id4 = null;
                                          Id10 = null;
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
                                              "${snapshot.data.result.lableList[10].lebalId}.$Id10";
                                          String a11 =
                                              "${snapshot.data.result.lableList[11].lebalId}.$Id11";
                                          String a12 =
                                              "${snapshot.data.result.lableList[12].lebalId}.$Id12";
                                          String a13 =
                                              "${snapshot.data.result.lableList[13].lebalId}.$Id13";
                                          String a14 =
                                              '${snapshot.data.result.lableList[9].lebalId}."${Id14.text}"';
                                          String a15 =
                                              '${snapshot.data.result.lableList[15].lebalId}."${Id15.text}"';
                                          String a16 =
                                              '${snapshot.data.result.lableList[16].lebalId}."${Id16.text}"';
                                          String a17 = houseType == "معماري"
                                              ? '${snapshot.data.result.lableList[17].lebalId}."${0}"'
                                              : '${snapshot.data.result.lableList[17].lebalId}."${1}"';
                                          String answer =
                                              '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12,$a13,$a14,$a15,$a16,$a17';
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
                                                      builder: (_) =>
                                                          SendDone()));
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
