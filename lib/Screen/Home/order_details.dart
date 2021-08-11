import 'package:delta/DataModel/order_detailsM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../draw.dart';

import '../../utils.dart';
import 'offer.dart';

class OrderDetails extends StatefulWidget {
  String name;
  String orderId;
  String jwt;

  OrderDetails({Key key, this.name, this.orderId, this.jwt}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: StreamBuilder<OrderDetailsM>(
          stream: _repo
              .getOrderDetails(
                  key: '1234567890',
                  token_id: widget.jwt,
                  lang: 'ar',
                  id_order: widget.orderId)
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
                            margin: EdgeInsets.only(top: 20.0, right: 10.0),
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
                          "طلبات الاستشارات",
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
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                borderOnForeground: true,
                                elevation: 2,
                                child: Container(
                                  color: Colors.grey,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 2.0, right: 5, left: 5),
                                          child: Container(
                                              width: size.width * .17,
                                              child: Text(
                                                "22-5-2021",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  fontFamily: 'GE SS Two',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xff0f0f10),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30.0,
                                              bottom: 8.0,
                                              right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                  width: size.width * .67,
                                                  child: Text("${widget.name}",
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                        fontFamily: 'GE SS Two',
                                                        fontSize:20,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xffececee),
                                                      )))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 8.0, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: size.width * .5,
                                      child: Text(
                                        "عنوان الطلب ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xfff8b304),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 20.0, right: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: size.width * .8,
                                      child: Text(
                                        "${widget.name}",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff0f0f10),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            //details
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 8.0, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: size.width * .5,
                                      child: Text(
                                        "التفاصيل ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xfff8b304),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 8.0, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: size.width * .8,
                                      child: Text(
                                        "${snapshot.data.result.orderDetails[0].formName}",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff0f0f10),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 8.0, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: size.width * .8,
                                      height: size.height * .52,
                                      child: Text(
                                        "${snapshot.data.result.orderDetails[0].details}",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff0f0f10),
                                        ),
                                      ))
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 8.0, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all()),
                                    // color: Colors.green,
                                    width: size.width * .9,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                              "assets/images/engineers.png"),
                                        ),
                                        Container(
                                            child: Text(
                                          "حالة الطلب",
                                          style: TextStyle(
                                            fontFamily: 'GE SS Two',
                                            fontSize: 17,
                                            color: Color(0xfff3a005),
                                            fontWeight: FontWeight.w300,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        )),
                                        Container(
                                            width: size.width * .7,
                                            child: Text(
                                              "${snapshot.data.result.orderDetails[0].finalDetails}",
                                              style: TextStyle(
                                                fontFamily: 'GE SS Two',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              textDirection: TextDirection.rtl,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: size.height * .06,
                                    width: size.width * .35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          height: size.height * 1,
                                          width: size.width * 1),
                                      child: ElevatedButton(
                                          child: Text(
                                            'العرض المالي',
                                            style: TextStyle(
                                              fontFamily: 'GE SS Two',
                                              fontSize: 17,
                                              color: const Color(0xff848484),
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
                                                    builder: (_) => Offer(jwt:widget.jwt,orderId: widget.orderId,)));
                                          }),
                                    ),
                                  ),
                                  Container(
                                    height: size.height * .06,
                                    width: size.width * .35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          height: size.height * 1,
                                          width: size.width * 1),
                                      child: ElevatedButton(
                                          child: Text(
                                            'تواصل مع الادارة',
                                            style: TextStyle(
                                              fontFamily: 'GE SS Two',
                                              fontSize: 17,
                                              color: const Color(0xff848484),
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
                                           Utils.openLink(url: 'https://wa.me/send?phone=${snapshot.data.result.orderDetails[0].whatsapp}');
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
