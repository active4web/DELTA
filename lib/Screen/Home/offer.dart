import 'package:delta/DataModel/order_details_moneyM.dart';
import 'package:delta/Repository/Repository.dart';

import 'package:delta/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Offer extends StatefulWidget {
  String orderId;
  String jwt;
   Offer({Key key,this.orderId,this.jwt}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {


  Repository _repo=Repository();
  String token;
  Future<String> gettoken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString("token");
  return token;
  }

  @override
  void initState() {
  gettoken();
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: StreamBuilder<OrderDetailsMoneyM>(
        stream: _repo.getOrderDetailsMoney(key: '1234567890', token_id: widget.jwt, id_order: widget.orderId).asStream(),
        builder: (context, snapshot) {
          if(snapshot.data!=null){
            if(snapshot.data.result.orderDetails!=[]){
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
                              tooltip:
                              MaterialLocalizations.of(context).openAppDrawerTooltip,
                            ),
                          ),
                        ),
                      ),
                    ],
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "العرض المالي",
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${snapshot.data.result.orderDetails[0].totalMoney} ",style: TextStyle(fontSize: 35,color: Color(0xff3b6745))),
                              Text("اجمالي المطلوب ",style: TextStyle(fontSize: 25), textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration:
                              BoxDecoration(
                                  color: Color(0xff3b6745),
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(25) ,bottomRight: Radius.circular(25))),
                              width: size.width*.85,
                              height: size.height*.07,
                              child: Center(child: Text("مقسمة علي ثلاث دفعات",style: TextStyle(fontSize: 20,color: Color(
                                  0xfff8faf9))),),
                            ),
                          ],
                        ),
                        //1
                        Container(
                          color: snapshot.data.result.orderDetails[0].type!='1' ?Colors.grey:Colors.white,
                          child: Column(children: [ Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${snapshot.data.result.orderDetails[0].paidValue}",style: TextStyle(fontSize: 35,color: Color(0xff3b6745))),
                                Text("الدفعة الاولي ",style: TextStyle(fontSize: 25), textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: size.width*.65,
                                    child: Text("${snapshot.data.result.orderDetails[0].details}",textAlign: TextAlign.center,style: TextStyle(fontSize: 18), textDirection: TextDirection.rtl,
                                    ),
                                  ),

                                ],
                              ),
                            ),],),
                        )
                       ,
                        //2
                        Container(
                          color: snapshot.data.result.orderDetails[1].type!='1' ?Colors.grey:Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${snapshot.data.result.orderDetails[1].paidValue} ",style: TextStyle(fontSize: 35,color: Color(0xff3b6745))),
                                    Text("الدفعة الثانية ",style: TextStyle(fontSize: 25), textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width*.65,

                                      child: Text("${snapshot.data.result.orderDetails[1].details}",textAlign: TextAlign.center,style: TextStyle(fontSize: 18), textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //3
                        Container(
                          color: snapshot.data.result.orderDetails[2].type!='1' ?Colors.grey:Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${snapshot.data.result.orderDetails[2].paidValue} ",style: TextStyle(fontSize: 35,color: Color(0xff3b6745))),
                                    Text("الدفعة الثالثة ",style: TextStyle(fontSize: 25), textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width*.65,
                                      child: Text("${snapshot.data.result.orderDetails[2].details}",textAlign: TextAlign.center,style: TextStyle(fontSize: 18), textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

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
                                      height:size.height * 1, width: size.width * 1),
                                  child: ElevatedButton(
                                      child: Text(
                                        'رجوع',
                                        style:   TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 17,
                                          color: const Color(0xffeceaea),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 20,
                                        primary:  Color(0xfff3a005),
                                        onPrimary: Colors.orangeAccent,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(15))),
                                      ),
                                      onPressed: () {

                                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>Offer()));
                                      }
                                  ),
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
                                      height:size.height * 1, width: size.width * 1),
                                  child: ElevatedButton(
                                      child: Text(
                                        'موافق',
                                        style:   TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 17,
                                          color: const Color(0xfffff7f7),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 20,
                                        primary:  Color(0xfff3a005),
                                        onPrimary: Colors.orangeAccent,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(15))),
                                      ),
                                      onPressed: () {

                                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>()));
                                      }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              );
            }else{return Material(child: Container(child: Center(child: Text("لاسوجد عروض مالية قائمة للطلب الحالي"),),));}

          }else{return Center(child: CircularProgressIndicator(),);}

        }
      ),
    );
  }
}
