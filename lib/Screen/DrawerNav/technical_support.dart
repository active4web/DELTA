import 'dart:async';

import 'package:delta/DataModel/user_ticketM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/DrawerNav/send-tickets.dart';
import 'package:delta/Screen/DrawerNav/ticket_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';

class TechSupport extends StatefulWidget {
  const TechSupport({Key key}) : super(key: key);

  @override
  _TechSupportState createState() => _TechSupportState();
}

class _TechSupportState extends State<TechSupport> {
  String token;

  Future <Null> gettoken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
  setState(() {
    token = pref.getString("token");
  });
  }
  @override
  void initState() {
    token ="";
    gettoken();
    print (token);
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
                  margin: EdgeInsets.only(top: 6.0, right: 10.0),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage("assets/images/menu.png"),
                      size: 25,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
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
                "الدعم الفني",
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
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  height: size.height * .06,
                  width: size.width * .8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(30))),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height:size.height * 1, width: size.width * 1),
                    child: ElevatedButton(
                      child: Text(
                        'انشاء رسالة',
                        style:   TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 19,
                          color: const Color(0xDCFFFCFC),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary:  Color(0xfff3a005),
                        onPrimary: Colors.orangeAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () {
                        print (token);
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SendTicket(jwt: token,)));
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*.9,
                    child: StreamBuilder<UserTicketsM>(
                      stream: _repo.getTickets(token_id: token, key: '1234567890', limit: '20', page_number: '0').asStream(),
                      builder: (context, snapshot) {
                      if(snapshot.data!=null){
                        return ListView.builder(
                          itemCount: snapshot.data.result.myTickets.length,
                         shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (_)=> TicketDetails(ticketId: snapshot.data.result.myTickets[index].id.toString(),)));
                              },
                              child: Card(
                                color:Colors.grey,
                                child: Container(
                                  width: size.width*.9,
                                  height: size.height*.15,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("${snapshot.data.result.myTickets[index].createdAt}",  style: TextStyle(
                                              fontFamily: 'GE SS Two',
                                              fontSize: 17,
                                              // fontWeight: FontWeight.w400,
                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("${snapshot.data.result.myTickets[index].title}",style: TextStyle(
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
                                              child: Text("${snapshot.data.result.myTickets[index].content}",textDirection: TextDirection.rtl,  style: TextStyle(
                                                fontFamily: 'GE SS Two',
                                                fontSize: 13,
                                                // fontWeight: FontWeight.w400,
                                              ),),
                                            ),
                                          ),

                                        ],
                                      ),
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
            ],
          ),
        ));
  }
}
