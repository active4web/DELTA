import 'dart:io';

import 'package:delta/DataModel/FormsModels/arch_residentialM.dart';
import 'package:delta/DataModel/FormsModels/construction_residenialM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../draw.dart';

import 'package:delta/Screen/Home/home_bar.dart';

import '../send_done.dart';

class ConstResidenial extends StatefulWidget {
  ConstResidenial({Key key, this.message,this.jwt, this.cat_id}) : super(key: key);
  String jwt;
  String cat_id;
  String message;
  @override
  _ConstResidenialState createState() => _ConstResidenialState();
}

class _ConstResidenialState extends State<ConstResidenial> {
  List _list0;
  int Id0;
  List _list1;
  int Id1;
  List _list2;
  int Id2;
  Dio dio = Dio();
  var baseurl = 'https://mdecco.com/app/';

  String token;
  Future<String> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  Future<ConstResidentialM> getConstResidentialF({
    @required String key,
    @required String token_id,
    @required String cat_id,
  }) async {
    ConstResidentialM data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/residential_construction_designn',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = ConstResidentialM.fromMap(value.data);
    });
    setState(() {
      _list2 = data.result.lableList[2].listAnwser.toList();
      _list1 = data.result.lableList[1].listAnwser.toList();
      _list0 = data.result.lableList[0].listAnwser.toList();
    });
    return data;
  }

  @override
  void initState() {
    gettoken();
    this.getConstResidentialF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
    super.initState();
  }

  Repository _repo = Repository();
  List<File> proFile1;
  List<File> proFile2;
  Future<void> openG1() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      proFile1 = result.paths.map((path) => File(path)).toList();
    } else {
      // User canceled the picker
    }
  }

  Future<void> openG2() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      proFile2 = result.paths.map((path) => File(path)).toList();
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<ConstResidentialM>(
          stream: _repo
              .getConstResidentialF(
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
                                    fontSize: 18,
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
                                  child:
                                      snapshot.data.result.lableList[1].type ==
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
                                                      child: _list1 != null
                                                          ? DropdownButton(
                                                              isExpanded: true,
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
                                  child: snapshot
                                              .data.result.lableList[3].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              //  controller: Id16,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ))
                                      : GestureDetector(
                                          onTap: () {
                                            openG1();
                                            print(proFile1);
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
                                  child: snapshot
                                              .data.result.lableList[4].type ==
                                          2
                                      ? Container(
                                          width: sWidth * .8,
                                          child: Container(
                                            child: TextField(
                                              //  controller: Id16,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ))
                                      : GestureDetector(
                                          onTap: () {
                                            openG2();
                                            print(proFile2);
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
                                        proFile1 = null;
                                        proFile2 = null;
                                        Id0 = null;
                                        Id1 = null;
                                        Id2 = null;
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
                                      if (Id2 != null &&
                                          Id1 != null &&
                                          Id0 != null) {
                                        String a0 =
                                            "${snapshot.data.result.lableList[0].lebalId}.$Id0";
                                        String a1 =
                                            "${snapshot.data.result.lableList[1].lebalId}.$Id1";
                                        String a2 =
                                            "${snapshot.data.result.lableList[2].lebalId}.$Id2";
                                        String a3 =
                                            "${snapshot.data.result.lableList[4].lebalId}.${1}";

                                        String answer = '$a0,$a1,$a2,$a3';
                                        _repo
                                            .sendCostBuildF(
                                          key: '1234567890',
                                          token_id: widget.jwt,
                                          cat_id: widget.cat_id,
                                          file: proFile1 + proFile2,
                                          answer: "$answer",
                                        )
                                            .then((value) {
                                          if (value.status == true) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        SendDone(message: value.message)));
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
