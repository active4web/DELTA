import 'dart:async';
import 'dart:convert';
import 'package:delta/DataModel/user_ticketM.dart';
import 'package:delta/DataModel/user_tickets_listM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';

import 'technical_support.dart';

class SendTicket extends StatefulWidget {
   SendTicket({Key key,this.jwt}) : super(key: key);
    String jwt;
  @override
  _SendTicketState createState() => _SendTicketState();
}

class _SendTicketState extends State<SendTicket> {
  String token;
  Dio dio=Dio();
  //TicketList
  Future<UserTicketsListM> TicketList({
    @required String key,
    @required String token
  }) async {
    UserTicketsListM data;
    FormData formData = new FormData.fromMap({
      "key": key,
      "token_id": token
    });
    await dio
        .post(
      baseurl + '/pages/tickets_types',
      data: formData,
    )
        .then((value) {
      print('done');
      print(value.data);
      data = UserTicketsListM.fromMap(value.data);
    });
    setState(() {
      _list0=data.result.ticketsTypes.toList();
    });
    return data;
  }
  List _list0;
  int Id0;
  var baseurl = 'https://wasselni.ps/delta/';

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerContent = TextEditingController();

  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }


  @override
  void initState() {
    token = "";
    gettoken();
    print(token);
    this.TicketList(key: '1234567890',token: widget.jwt);
    super.initState();
  }

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_sharp),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [

            //cccxcx


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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "انشاء تذكرة",
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
        endDrawer:  NewWidget(size: size, token: token),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
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
                                    e.name,
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
                              e.id,
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
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .8,
                      height: size.height * .06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white38,
                      ),
                      child: TextField(
                        controller: controllerTitle,
                          decoration: InputDecoration(
                            hintText: '    الموضوع  ',
                            hintStyle:    TextStyle(
                              fontFamily:
                              'GE SS Two',
                              fontSize:
                              17,
                              color:
                              const Color(-384871238),
                              fontWeight:
                              FontWeight.w300,
                            ),
                            hintTextDirection: TextDirection.rtl,
                            //    prefixIcon: Icon(Icons.email)
                          ),
                          textDirection: TextDirection.rtl),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .8,
                      height: size.height * .16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white38,
                      ),
                      child: TextField(
                        controller: controllerContent,
                        maxLines: 6,
                          decoration: InputDecoration(
                            hintText: '    محتوي الشكوي  ',
                            hintStyle:    TextStyle(
                              fontFamily:
                              'GE SS Two',
                              fontSize:
                              17,
                              color:
                              const Color(-384871238),
                              fontWeight:
                              FontWeight.w300,
                            ),
                            hintTextDirection: TextDirection.rtl,
                            //    prefixIcon: Icon(Icons.email)
                          ),
                          textDirection: TextDirection.rtl),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  height: size.height * .06,
                  width: size.width * .8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height: size.height * 1, width: size.width * 1),
                    child: ElevatedButton(
                      child: Text(
                        'ارسال',
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 19,
                          color: const Color(0xDCFFFCFC),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Color(0xfff3a005),
                        onPrimary: Colors.orangeAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: ()async {
                        _repo.makeTicket(key: '1234567890', token: token, ticket_type_id: Id0.toString(), title: controllerTitle.text, content: controllerContent.text)
                            .then((value){
                           if(value.status!=false){
                             var snackBar = SnackBar(content: Text('${value.message}'));
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             Navigator.push(context,MaterialPageRoute(builder: (_)=>TechSupport()));
                           }else{
                             var snackBar = SnackBar(content: Text('${value.message}'));
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                          });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

}


