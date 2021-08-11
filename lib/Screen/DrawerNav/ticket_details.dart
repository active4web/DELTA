

import 'dart:async';
import 'dart:convert';
import 'package:delta/DataModel/ticketInfoM.dart';
import 'package:delta/DataModel/user_ticketM.dart';
import 'package:delta/DataModel/user_tickets_listM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Home/order_track.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import '../../shared.dart';
import '../login.dart';
import 'about_app.dart';
import 'blogs.dart';
import 'contact_us.dart';
import 'not_logged_in.dart';
import 'notifications.dart';
import '../Home/projectDetails.dart';
import 'profile.dart';
import 'technical_support.dart';



class TicketDetails extends StatefulWidget {
   TicketDetails({this.ticketId,Key key}) : super(key: key);
   String ticketId;
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  String token;
  TextEditingController controllerContent = TextEditingController();
  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }

  String _mySelection;

  @override
  void initState() {
    token = "";
    gettoken();
    print(token);
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
            Container(
              alignment: Alignment.center,
              child: Builder(
                builder: (context) => Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 8.0, right: 10.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "تفاصيل التذكرة",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*.9,
                    child: StreamBuilder<TicketInfoM>(
                        stream: _repo.getTicketInfo(token_id: token, key: '1234567890', ticket_id:widget.ticketId ).asStream(),
                        builder: (context, snapshot) {
                          if(snapshot.data!=null){
                            return ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context,index){
                                return Card(
                                  color:Colors.grey,
                                  child: Container(
                                    width: size.width*.9,
                                    height: size.height*.8,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("${snapshot.data.result.ticketInfo.ticket.createdAt}",  style: TextStyle(
                                                  fontFamily: 'GE SS Two',
                                                  fontSize: 17,
                                                  // fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("${snapshot.data.result.ticketInfo.ticket.title}",style: TextStyle(
                                                  fontFamily: 'GE SS Two',
                                                  fontSize: 17,
                                                  // fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Container(
                                                  height : size.height*.078,
                                                  width: size.width*0.8,
                                                  child: Text("${snapshot.data.result.ticketInfo.ticket.content}",textDirection: TextDirection.rtl,  style: TextStyle(
                                                    fontFamily: 'GE SS Two',
                                                    fontSize: 13,
                                                    // fontWeight: FontWeight.w400,
                                                  ),),
                                                ),
                                              ),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("الردود",style: TextStyle(
                                                  fontFamily: 'GE SS Two',
                                                  fontSize: 17,
                                                  // fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("${snapshot.data.result.ticketInfo.repliesNumber}",  style: TextStyle(
                                                  fontFamily: 'GE SS Two',
                                                  fontSize: 17,
                                                  // fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("عدد الردود",style: TextStyle(
                                                  fontFamily: 'GE SS Two',
                                                  fontSize: 17,
                                                  // fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                            ],
                                          ),
                                          ListView.builder(
                                              itemCount: snapshot.data.result.ticketInfo.ticketReplies.length,
                                              shrinkWrap: true,
                                                  physics: ScrollPhysics(),
                                         itemBuilder: (context,index){
                                                return
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Card(child: Column(
                                                        children: [
                                                          Container(
                                                              width: size.width*.9,
                                                              height: size.height*.15,
                                                              color: Colors.black12,
                                                              child: Text("${snapshot.data.result.ticketInfo.ticketReplies[index].content}",textDirection: TextDirection.rtl,  style: TextStyle(
                                                                fontFamily: 'GE SS Two',
                                                                fontSize: 13,
                                                                // fontWeight: FontWeight.w400,
                                                              ))),
                                                          Container(
                                                              width: size.width*.9,
                                                              height: size.height*.05,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text("${snapshot.data.result.ticketInfo.ticketReplies[index].createdAt.toString().substring(0,10)}",textDirection: TextDirection.rtl,  style: TextStyle(
                                                                        fontFamily: 'GE SS Two',
                                                                        fontSize: 13,
                                                                        // fontWeight: FontWeight.w400,
                                                                      )),
                                                                      Text("  ${snapshot.data.result.ticketInfo.ticketReplies[index].time}الساعة ",textDirection: TextDirection.rtl,  style: TextStyle(
                                                                        fontFamily: 'GE SS Two',
                                                                        fontSize: 13,
                                                                        // fontWeight: FontWeight.w400,
                                                                      )),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text("${snapshot.data.result.ticketInfo.ticketReplies[index].sender}",textDirection: TextDirection.rtl,  style: TextStyle(
                                                                        fontFamily: 'GE SS Two',
                                                                        fontSize: 13,
                                                                        // fontWeight: FontWeight.w400,
                                                                      )),
                                                                      Text("المرسل : ",textDirection: TextDirection.rtl,  style: TextStyle(
                                                                        fontFamily: 'GE SS Two',
                                                                        fontSize: 13,
                                                                        // fontWeight: FontWeight.w400,
                                                                      )),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),),
                                                    );
                                         }

                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },);
                          }else{return Center(child: CircularProgressIndicator(),);}
                        }
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()async{

                        if(controllerContent.text!=null||controllerContent.text!="")
                          {
                            _repo.ticketReply(key: '1234567890', token_id: token, ticket_id: widget.ticketId, content: controllerContent.text)
                                .then((value) {
                              if(value.status!=false){
                                var snackBar = SnackBar(content: Text('${value.message}'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }else{  var snackBar = SnackBar(content: Text('حدث خطأ برجاء اعادة الارسال بشكل صحيح'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar); }
                            });
                          }

                      },
                      child: Container(width: size.width*1.7,
                        height: size.height*0.05,
                        child: Icon(Icons.send),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * .8,
                    height: size.height * .06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                    ),
                    child: TextField(
                        controller: controllerContent,
                        decoration: InputDecoration(
                          hintText: '    ارسال رد  ',
                          hintTextDirection: TextDirection.rtl,
                          //    prefixIcon: Icon(Icons.email)
                        ),
                        textDirection: TextDirection.rtl),
                  ),
                ],),
            ],
          ),
        ));
  }
}
