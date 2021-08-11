import 'dart:io';

import 'package:delta/DataModel/FormsModels/arch_residentialM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../draw.dart';

import 'package:delta/Screen/Home/home_bar.dart';

import '../send_done.dart';

class ArchResidentialDesign extends StatefulWidget {
  ArchResidentialDesign({Key key, this.jwt, this.cat_id}) : super(key: key);
  String jwt;
  String cat_id;

  @override
  _ArchResidentialDesignState createState() => _ArchResidentialDesignState();
}

enum SingingCharacter4 { classic, modern }
SingingCharacter4 _character_design = SingingCharacter4.modern;

enum SingingCharacter3 { yes, no }
SingingCharacter3 _character_living = SingingCharacter3.yes;

enum SingingCharacterneighbor { yes, no }
SingingCharacterneighbor _character_neighbor = SingingCharacterneighbor.yes;

enum SingingCharacterpool { yes, no }
SingingCharacterpool _character_pool = SingingCharacterpool.yes;

enum SingingCharacterArchDesign { yes, no }
SingingCharacterArchDesign _character_ArchDesign =
    SingingCharacterArchDesign.yes;

enum SingingCharacterLoc { yes, no }
SingingCharacterLoc _character_Loc = SingingCharacterLoc.yes;

enum SingingCharacterKitchen { open, close }
SingingCharacterKitchen _character_kitchen = SingingCharacterKitchen.open;

enum SingingCharacter { bathroom, no_bathroom }
SingingCharacter _character_bath = SingingCharacter.bathroom;

enum SingingCharacterPoolSide { inside, outside }
SingingCharacterPoolSide _character_PoolSide = SingingCharacterPoolSide.inside;

enum SingingCharacterGarden { no, yes }
SingingCharacterGarden _character_Garden = SingingCharacterGarden.yes;

enum SingingCharacterDirection { north, South, east, West }
SingingCharacterDirection _character_Direction =
    SingingCharacterDirection.north;

enum SingingCharacterSystem {
  hurudi,
  fungal_slab,
  Solid_slab,
  Flat_slabs_for_large_spaces
}
SingingCharacterSystem _character_System = SingingCharacterSystem.hurudi;

enum SingingCharacterHurudi { pumice, Bajaur, Bumchi }
SingingCharacterHurudi _character_hurudi = SingingCharacterHurudi.pumice;

enum SingingCharacterWall { Separators, Bumchi, Block, Concrete }
SingingCharacterWall _character_wall = SingingCharacterWall.Separators;

class _ArchResidentialDesignState extends State<ArchResidentialDesign> {
  num _counter_bedroom = 0;
  num _counter_bathroom = 0;
  num _counter_kitchen = 0;
  num _counter_sides = 0;
  num _counter_livingroom = 0;
  num _counter_out = 0;
  void _increment_livingroom() {
    setState(() {
      _counter_livingroom++;
    });
  }

  void _dicrement_livingroom() {
    setState(() {
      _counter_livingroom--;
    });
  }

  void _increment_bedroom() {
    setState(() {
      _counter_bedroom++;
    });
  }

  void _dicrement_bedroom() {
    setState(() {
      _counter_bedroom--;
    });
  }

  void _increment_bathroom() {
    setState(() {
      _counter_bathroom++;
    });
  }

  void _dicrement_bathroom() {
    setState(() {
      _counter_bathroom--;
    });
  }

  void _increment_kitchen() {
    setState(() {
      _counter_kitchen++;
    });
  }

  void _dicrement_kitchen() {
    setState(() {
      _counter_kitchen--;
    });
  }

  void _increment_sides() {
    setState(() {
      _counter_sides++;
    });
  }

  void _dicrement_sides() {
    setState(() {
      _counter_sides--;
    });
  }

  void _increment_out() {
    setState(() {
      _counter_out++;
    });
  }

  void _dicrement_out() {
    setState(() {
      _counter_out--;
    });
  }

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
  List _list11;
  int Id11;
  TextEditingController Id0 = TextEditingController();
  TextEditingController Id1 = TextEditingController();
  TextEditingController Id8 = TextEditingController();
  TextEditingController Id9 = TextEditingController();
  TextEditingController Id10 = TextEditingController();
  //TextEditingController Id11= TextEditingController();
  TextEditingController Id12 = TextEditingController();
  TextEditingController Id13 = TextEditingController();
  TextEditingController Id14 = TextEditingController();
  TextEditingController Id15 = TextEditingController();
  TextEditingController Id16 = TextEditingController();
  TextEditingController Id17 = TextEditingController();
  TextEditingController Id18 = TextEditingController();
  TextEditingController Id19 = TextEditingController();
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

  Dio dio = Dio();
  var baseurl = 'https://wasselni.ps/delta/';
  //getArchResidentiallists
  Future<ArchResidentialM> getArchResidentialF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ArchResidentialM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/architectural_residential_design',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ArchResidentialM.fromMap(value.data);
    });
    setState(() {
      _list2 = data.result.lableList[2].listAnwser.toList();
      _list3 = data.result.lableList[3].listAnwser.toList();
      _list4 = data.result.lableList[4].listAnwser.toList();
      _list5 = data.result.lableList[5].listAnwser.toList();
      _list6 = data.result.lableList[6].listAnwser.toList();
      _list7 = data.result.lableList[7].listAnwser.toList();
      _list11 = data.result.lableList[11].listAnwser.toList();
    });
    return data;
  }

  String token;
  Future<String> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  @override
  void initState() {
    gettoken();
    this.getArchResidentialF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
    super.initState();
  }

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<ArchResidentialM>(
          stream: _repo
              .getArchResidentialF(
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
                                  child: snapshot
                                              .data.result.lableList[0].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id0,
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
                                  child: snapshot
                                              .data.result.lableList[8].type ==
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
                                  child: snapshot
                                              .data.result.lableList[9].type ==
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
                                  child: snapshot
                                              .data.result.lableList[10].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id10,
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
                                  child:
                                      snapshot.data.result.lableList[11].type ==
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
                                                      child: _list11 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
                                                              items: _list11
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
                                              controller: Id12,
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
                                              controller: Id16,
                                              textDirection: TextDirection.rtl,
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
                                  child: snapshot
                                              .data.result.lableList[14].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id14,
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
                                  child: snapshot
                                              .data.result.lableList[15].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id15,
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
                                  child: snapshot
                                              .data.result.lableList[16].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id16,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ))
                                      : GestureDetector(
                                          // onTap: (){
                                          //   openG();
                                          //   print(proFile);
                                          //      },
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
                                  "${snapshot.data.result.lableList[17].title}",
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
                                              .data.result.lableList[17].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id17,
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
                      //18
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
                                  "${snapshot.data.result.lableList[18].title}",
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
                                              .data.result.lableList[18].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id18,
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
                                  "${snapshot.data.result.lableList[19].title}",
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
                                              .data.result.lableList[19].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id19,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ))
                                      : GestureDetector(
                                          // onTap: (){
                                          //   openG();
                                          //   print(proFile);
                                          //      },
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
                                        proFile = null;
                                        Id2 = null;
                                        Id3 = null;
                                        Id4 = null;
                                        Id5 = null;
                                        Id6 = null;
                                        Id7 = null;
                                        Id11 = null;
                                        Id0.text = '';
                                        Id1.text = '';
                                        Id2 = null;
                                        Id14.text = '';
                                        Id15.text = '';
                                        Id16.text = '';
                                        Id17.text = '';
                                        Id18.text = '';
                                        Id9.text = '';
                                        Id10.text = '';
                                        Id19.text = '';
                                        Id12.text = '';
                                        Id13.text = '';
                                        Id14.text = '';
                                        Id15.text = '';
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
                                      if (Id0.text != null &&
                                          Id1.text != null &&
                                          Id0.text != '' &&
                                          Id1.text != '' &&
                                          Id2 != null &&
                                          Id3 != null &&
                                          Id4 != null &&
                                          Id5 != null &&
                                          Id6 != null &&
                                          Id7 != null &&
                                          Id14.text != null &&
                                          Id15.text != null &&
                                          Id16.text != null &&
                                          Id17.text != null &&
                                          Id8.text != null &&
                                          Id9.text != null &&
                                          Id10.text != null &&
                                          Id11 != null &&
                                          Id12.text != null &&
                                          Id14.text != null &&
                                          Id15.text != null &&
                                          Id14.text != '' &&
                                          Id15.text != '' &&
                                          Id16.text != '' &&
                                          Id17.text != '' &&
                                          Id8.text != '' &&
                                          Id9.text != '' &&
                                          Id10.text != '' &&
                                          Id12.text != '' &&
                                          Id14.text != '' &&
                                          Id15.text != '' &&
                                          Id19.text != '') {
                                        String a0 =
                                            '${snapshot.data.result.lableList[0].lebalId}."${Id0.text}"';
                                        String a1 =
                                            '${snapshot.data.result.lableList[1].lebalId}."${Id1.text}"';
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
                                            '${snapshot.data.result.lableList[8].lebalId}."${Id8.text}"';
                                        String a9 =
                                            '${snapshot.data.result.lableList[9].lebalId}."${Id9.text}"';
                                        String a10 =
                                            '${snapshot.data.result.lableList[10].lebalId}."${Id10.text}"';
                                        String a11 =
                                            "${snapshot.data.result.lableList[11].lebalId}.$Id11";
                                        String a12 =
                                            '${snapshot.data.result.lableList[12].lebalId}."${Id12.text}"';
                                        //  String a13='${snapshot.data.result.lableList[13].lebalId}."${Id13.text}"';
                                        String a14 =
                                            '${snapshot.data.result.lableList[14].lebalId}."${Id14.text}"';
                                        String a15 =
                                            '${snapshot.data.result.lableList[15].lebalId}."${Id15.text}"';
                                        String a16 =
                                            '${snapshot.data.result.lableList[16].lebalId}."${Id16.text}"';
                                        String a17 =
                                            '${snapshot.data.result.lableList[17].lebalId}."${Id17.text}"';
                                        String a18 =
                                            '${snapshot.data.result.lableList[18].lebalId}."${Id18.text}"';
                                        String a19 =
                                            '${snapshot.data.result.lableList[19].lebalId}."${Id19.text}"';
                                        String a20 =
                                            "${snapshot.data.result.lableList[20].lebalId}.${0}";
                                        String answer =
                                            '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12,$a14,$a15,$a16,$a17,$a18,$a19,$a20';
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
