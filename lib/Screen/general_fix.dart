import 'package:delta/DataModel/FormsModels/general_fixM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../draw.dart';
import 'Home/home_bar.dart';
import 'send_done.dart';

class GeneralFix extends StatefulWidget {
  String? cat_id;
  String ?jwt;
  GeneralFix({ this.jwt, this.cat_id});

  @override
  _GeneralFixState createState() => _GeneralFixState();
}

class _GeneralFixState extends State<GeneralFix> {
  int? id0;
  List? _list0;

  String? token;
  Future<String?> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  @override
  void initState() {
    gettoken();
    this.getGeneralFixF(
        key: '1234567890', token_id: widget.jwt, cat_id: widget.cat_id);
    super.initState();
  }

  Dio dio = Dio();
  var baseurl = 'https://mdecco.com/app/';
  Future<GeneralFixM?> getGeneralFixF({
    required String? key,
    required String? token_id,
    required String? cat_id,
  }) async {
    GeneralFixM? data;
    FormData formData = new FormData.fromMap(
        {"key": key, "token_id": token_id, "cat_id": cat_id});
    await dio
        .post(
      baseurl + '/user_api/set_general_maintenance',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = GeneralFixM.fromMap(value.data);
    });
    setState(() {
      _list0 = data?.result?.lableList?[0].listAnwser?.toList();
    });
    return data;
  }

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<GeneralFixM>(
          stream: _repo
              .getGeneralFixF(
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
                  endDrawer: NewWidget(size: size, token: token,),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        //description
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
                                    "نوع الصيانة",
                                    // "${snapshot.data?.result?.lableList?[11].title}",textDirection: TextDirection.rtl,
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
                                        // snapshot.data?.result?.lableList?[11].type==2
                                        false
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
                                                        child: _list0 != null
                                                            ? DropdownButton(
                                                                isExpanded:
                                                                    true,
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
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    id0 = val as int?;
                                                                    print(id0
                                                                        .toString());
                                                                  },);
                                                                },
                                                                value: id0,
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
                                    "${snapshot.data?.result?.categoryDate?.details}",
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
                                        backgroundColor: Color(0xfff3a005), // Button background color
                                        foregroundColor: Colors.orangeAccent, // Button text color
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          id0 = null;
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
                                        if (id0 != null) {
                                          print(widget.cat_id);
                                          print(snapshot.data?.result?.lableList?[0].lebalId);
                                          print(id0);
                                          String a0 =
                                              "${snapshot.data?.result?.lableList?[0].lebalId}.$id0";
                                          String answer = '$a0';
                                          print(a0);
                                          print(answer);
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
                                        backgroundColor: Color(0xfff3a005), // Button background color
                                        foregroundColor: Colors.orangeAccent, // Button text color
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
