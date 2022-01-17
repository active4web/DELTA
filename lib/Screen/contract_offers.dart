import 'dart:io';

import 'package:delta/DataModel/FormsModels/contracting_offersM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../draw.dart';
import 'Home/home_bar.dart';
import 'send_done.dart';

class ContractOffers extends StatefulWidget {
  ContractOffers({Key key, this.cat_id, this.jwt}) : super(key: key);

  String cat_id;
  String jwt;
  @override
  _ContractOffersState createState() => _ContractOffersState();
}

enum SingingCharacter { commercial, residential, serve }
enum SingingCharacter2 { central, normal }

class _ContractOffersState extends State<ContractOffers> {
  var dropdownValue1 = 'نوع الخدمة المطلوبة';

  num _counter1 = 0;
  num _counter2 = 0;
  num _counter3 = 0;
  num _counter4 = 0;
  num _counter5 = 0;
  num _counter6 = 0;
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

  void _increment5() {
    setState(() {
      _counter4++;
    });
  }

  void _dicrement5() {
    setState(() {
      _counter4--;
    });
  }

  void _increment6() {
    setState(() {
      _counter4++;
    });
  }

  void _dicrement6() {
    setState(() {
      _counter4--;
    });
  }

  SingingCharacter _character1 = SingingCharacter.residential;
  SingingCharacter2 _character2 = SingingCharacter2.central;
  SingingCharacter2 _character3 = SingingCharacter2.central;

  String token;

  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }

  TextEditingController Id4 = TextEditingController();
  TextEditingController Id5 = TextEditingController();
  TextEditingController Id6 = TextEditingController();
  TextEditingController Id7 = TextEditingController();
  TextEditingController Id8 = TextEditingController();
  TextEditingController Id9 = TextEditingController();
  TextEditingController Id10 = TextEditingController();
  TextEditingController Id11 = TextEditingController();
  TextEditingController Id12 = TextEditingController();
  TextEditingController Id13 = TextEditingController();
  TextEditingController Id14 = TextEditingController();
  TextEditingController Id15 = TextEditingController();
  TextEditingController Id16 = TextEditingController();
  var baseurl = 'https://mdecco.com/app/';
  List _list0;
  int Id0;
  List _list1;
  int Id1;
  List _list2;
  int Id2;
  List _list3;
  int Id3;
  List<File> proFile;
  @override
  void initState() {
    token = "";
    gettoken();
    print(token);
    this.getContractingOffersF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
    super.initState();
  }

  Dio dio = Dio();
  Future<ContractingOffersM> getContractingOffersF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ContractingOffersM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_contracting_offers',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ContractingOffersM.fromMap(value.data);
    });
    setState(() {
      _list0 = data.result.lableList[0].listAnwser.toList();
      _list1 = data.result.lableList[1].listAnwser.toList();
      _list2 = data.result.lableList[2].listAnwser.toList();
      _list3 = data.result.lableList[3].listAnwser.toList();
    });
    return data;
  }

  Future<void> openG() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      proFile = result.paths.map((path) => File(path)).toList();
    } else {
      // User canceled the picker
    }
  }

  Repository _repo = Repository();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<ContractingOffersM>(
        stream: _repo
            .getContractingOffersF(
                key: '1234567890', token_id: token, cat_id: widget.cat_id)
            .asStream(),
        builder: (context, snapshot) {
          return Scaffold(
              appBar: snapshot.data != null
                  ? AppBar(
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
                    )
                  : null,
              endDrawer: NewWidget(size: size, token: token),
              body: snapshot.data != null
                  ? SingleChildScrollView(
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
//text
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
                                    child: snapshot.data.result.lableList[4]
                                                .type ==
                                            2
                                        ? Container(
                                            width: sWidth * .8,
                                            child: Container(
                                              child: TextField(
                                                controller: Id4,
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
                                  child: snapshot
                                              .data.result.lableList[5].type ==
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
                                  child: snapshot
                                              .data.result.lableList[6].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              controller: Id6,
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
                                              controller: Id11,
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
                                              controller: Id13,
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
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       height: sHeight*.05,
//                       width: sWidth*.9,
//                       child: Text(
//                         "تقدم شركة مثلث دلتا للمقاولات ارقي خدمات البناء و التشييد من حيث الجودة و التكلفة و مدة الإنجاز",
//                         textDirection: TextDirection.rtl,
//                         style: TextStyle(
//                           fontFamily: 'GE SS Two',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: Container(
//                           child: DropdownButton<String>(
//                             hint: Text(
//                               'نوع الخدمة المطلوبة',
//                               style: TextStyle(fontFamily: 'Cairo'),
//                             ),
//                             value: dropdownValue1,
//                             isExpanded: true,
//                             elevation: 30,
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                             onChanged: (String newValue) {
//                               setState(() {
//                                 dropdownValue1 = newValue;
//                               });
//                             },
//                             items: <String>[
//                               'نوع الخدمة المطلوبة',
//                               'item1',
//                               'item2',
//                               'item3',
//                             ].map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Container(
//                                     width: size.width * .7,
//                                     alignment: Alignment.centerRight,
//                                     child: Text(
//                                       value,
//                                       textDirection: TextDirection.rtl,
//                                       style: TextStyle(
//                                         fontFamily: 'GE SS Two',
//                                         fontSize: 17,
//                                         color: const Color(0xff848484),
//                                         fontWeight: FontWeight.w300,
//                                       ),
//                                     )),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
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
//                                     "عدد الغرف",
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
//                 //3&4
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
//                                           _increment3();
//                                           print(_counter3);
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon:
//                                         Icon(Icons.keyboard_arrow_down_outlined),
//                                         onPressed: () {
//                                           _dicrement3();
//                                           print(_counter3);
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
//                                   child: Center(child: Text("$_counter3"))),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "عدد الحمامات",
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
//                                           _increment4();
//                                           print(_counter4);
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon:
//                                         Icon(Icons.keyboard_arrow_down_outlined),
//                                         onPressed: () {
//                                           _dicrement4();
//                                           print(_counter4);
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
//                                   child: Center(child: Text("$_counter4"))),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "عدد الصالات ",
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
//                   //5&6
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
//                                           _increment5();
//                                           print(_counter5);
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon:
//                                         Icon(Icons.keyboard_arrow_down_outlined),
//                                         onPressed: () {
//                                           _dicrement5();
//                                           print(_counter5);
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
//                                   child: Center(child: Text("$_counter5"))),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "عدد المصاعد",
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
//                                           _increment6();
//                                           print(_counter6);
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon:
//                                         Icon(Icons.keyboard_arrow_down_outlined),
//                                         onPressed: () {
//                                           _dicrement6();
//                                           print(_counter6);
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
//                                   child: Center(child: Text("$_counter6"))),
//                               Container(
//                                   width: sWidth * .2,
//                                   child: Text(
//                                     "عدد المطابخ ",
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
//         //star_degree
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
//                                   width: sWidth * .2,
//                                   child: Center(child: TextField())),
//                               Container(
//                                   width: sWidth * .5,
//                                   child: Text(
//                                     "درجة التشطيب من نجمة الي خمسة",
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
// //country
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
//                //   radio_btn
//                   //block1
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         Container(
//                             width: sWidth * .3,
//                             child: Text(
//                               "نوع المبني",
//                               textDirection: TextDirection.rtl,
//                               style: TextStyle(
//                                 fontFamily: 'GE SS Two',
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           children: [
//                             Container(
//                               width: sWidth * .3,
//                               child: ListTile(
//                                 title: const Text('خدمي'),
//                                 leading: Radio<SingingCharacter>(
//                                   value: SingingCharacter.serve,
//                                   groupValue: _character1,
//                                   onChanged: (SingingCharacter value) {
//                                     setState(() {
//                                       _character1 = value;
//                                       print(_character1);
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: sWidth * .32,
//                               child: ListTile(
//                                 title: const Text('تجاري'),
//                                 leading: Radio<SingingCharacter>(
//                                   value: SingingCharacter.commercial,
//                                   groupValue: _character1,
//                                   onChanged: (SingingCharacter value) {
//                                     setState(() {
//                                       _character1 = value;
//                                       print(_character1);
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: sWidth * .31,
//                               child: ListTile(
//                                 title: const Text('سكني'),
//                                 leading: Radio<SingingCharacter>(
//                                   value: SingingCharacter.residential,
//                                   groupValue: _character1,
//                                   onChanged: (SingingCharacter value) {
//                                     setState(() {
//                                       _character1 = value;
//                                       print(_character1);
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       ],
//                     ),
//                   ),
//                   //block2
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
//                                   title: const Text('عادي'),
//                                   leading: Radio<SingingCharacter2>(
//                                     value: SingingCharacter2.normal,
//                                     groupValue: _character2,
//                                     onChanged: (SingingCharacter2 value) {
//                                       setState(() {
//                                         _character2 = value;
//                                         print(_character2);
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: sWidth * .32,
//                                 child: ListTile(
//                                   title: const Text('مركزي'),
//                                   leading: Radio<SingingCharacter2>(
//                                     value: SingingCharacter2.central,
//                                     groupValue: _character2,
//                                     onChanged: (SingingCharacter2 value) {
//                                       setState(() {
//                                         _character2 = value;
//                                         print(_character2);
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
//                               "نوع التكييف",
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
//                   //block3
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
//                                   title: const Text('عادي'),
//                                   leading: Radio<SingingCharacter2>(
//                                     value: SingingCharacter2.normal,
//                                     groupValue: _character3,
//                                     onChanged: (SingingCharacter2 value) {
//                                       setState(() {
//                                         _character3 = value;
//                                         print(_character3);
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: sWidth * .32,
//                                 child: ListTile(
//                                   title: const Text('مركزي'),
//                                   leading: Radio<SingingCharacter2>(
//                                     value: SingingCharacter2.central,
//                                     groupValue: _character3,
//                                     onChanged: (SingingCharacter2 value) {
//                                       setState(() {
//                                         _character3 = value;
//                                         print(_character3);
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
//                               "نوع التدفئة",
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
// ////////////////
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
//                                     "مساحة المسقوف الاجمالية",
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
//                             decoration: InputDecoration(hintText: "ملاحظات",hintTextDirection: TextDirection.rtl),
//                             maxLines: 5,
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
//
                      ////
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
                                        Id0 = null;
                                        Id1 = null;
                                        Id2 = null;
                                        Id3 = null;
                                        Id4.text = '';
                                        Id5.text = '';
                                        Id6.text = '';
                                        Id7.text = '';
                                        Id8.text = '';
                                        Id9.text = '';
                                        Id10.text = '';
                                        Id11.text = '';
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
                                      if (Id0 != null &&
                                          Id1 != null &&
                                          Id2 != null &&
                                          Id3 != null &&
                                          Id4.text != null &&
                                          Id5.text != null &&
                                          Id6.text != null &&
                                          Id7.text != null &&
                                          Id8.text != null &&
                                          Id9.text != null &&
                                          Id10.text != null &&
                                          Id11.text != null &&
                                          Id12.text != null &&
                                          Id13.text != null &&
                                          Id14.text != null &&
                                          Id15.text != null &&
                                          Id4.text != '' &&
                                          Id5.text != '' &&
                                          Id6.text != '' &&
                                          Id7.text != '' &&
                                          Id8.text != '' &&
                                          Id9.text != '' &&
                                          Id10.text != '' &&
                                          Id11.text != '' &&
                                          Id12.text != '' &&
                                          Id13.text != '' &&
                                          Id14.text != '' &&
                                          Id15.text != '') {
                                        String a0 =
                                            "${snapshot.data.result.lableList[0].lebalId}.$Id0";
                                        String a1 =
                                            "${snapshot.data.result.lableList[1].lebalId}.$Id1";
                                        String a2 =
                                            "${snapshot.data.result.lableList[2].lebalId}.$Id2";
                                        String a3 =
                                            "${snapshot.data.result.lableList[3].lebalId}.$Id3";
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
                                            '${snapshot.data.result.lableList[11].lebalId}."${Id11.text}"';
                                        String a12 =
                                            '${snapshot.data.result.lableList[12].lebalId}."${Id12.text}"';
                                        String a13 =
                                            '${snapshot.data.result.lableList[13].lebalId}."${Id13.text}"';
                                        String a14 =
                                            '${snapshot.data.result.lableList[14].lebalId}."${Id14.text}"';
                                        String a15 =
                                            '${snapshot.data.result.lableList[15].lebalId}."${Id15.text}"';
                                        //  String a16='${snapshot.data.result.lableList[16].lebalId}."${Id16.text}"';
                                        String answer =
                                            '$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12,$a13,$a14,$a15';
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
                    ]))
                  : Center(
                      child: CircularProgressIndicator(),
                    ));
        });
  }
}
