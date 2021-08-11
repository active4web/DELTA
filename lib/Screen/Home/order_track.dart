import 'package:delta/DataModel/ordersM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'order_details.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({Key key}) : super(key: key);

  @override
  _OrderTrackState createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  String token;

  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }


  @override
  void initState() {

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
      body: StreamBuilder<OrdersM>(
        stream: _repo.getOrdes(key: '1234567890', token_id: token, lang: 'ar').asStream(),
        builder: (context, snapshot) {
          if(snapshot.data!=null)
         {
           if(snapshot.data.result.orderDetails!=[])
             { return ListView.builder(
               shrinkWrap: true,
               itemCount: snapshot.data.result.orderDetails.length,
               itemBuilder: (context, index) {
                 if(snapshot.data!=null){
                   return SingleChildScrollView(
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderDetails(jwt: token,orderId: snapshot.data.result.orderDetails[index].idOrder.toString(),name: snapshot.data.result.orderDetails[index].requestName,)));
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Card(
                           elevation: 2,
                           child: Column(children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(
                                       top: 2.0, bottom: 5.0, right: 20),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Container(
                                           width: size.width * .21,
                                           height: size.height * .03,

                                           child: Text(
                                             "${snapshot.data.result.orderDetails[index].date.toString().substring(0,10)}",
                                             textDirection: TextDirection.rtl,
                                             style: TextStyle(
                                               fontFamily: 'GE SS Two',
                                               fontSize: 17,
                                               fontWeight: FontWeight.w300,
                                             ),
                                           ))
                                     ],
                                   ),
                                 ),
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           top: 5.0, bottom: 5.0, right: 5),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           Container(
                                               width: size.width * .27,
                                               height: size.height * .08,
                                               child: Text(
                                                 "${snapshot.data.result.orderDetails[index].requestName}",
                                                 textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                   fontFamily: 'GE SS Two',
                                                   fontSize: 17,
                                                   fontWeight: FontWeight.w300,
                                                 ),
                                               )),  Container(
                                               width: size.width * .22,
                                               height: size.height * .08,
                                               child: Text(
                                                 "اسم الطلب",
                                                 textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                     color: Colors.grey, fontSize: 18),
                                               ))
                                         ],
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           top: 5.0, bottom: 5.0, right: 5),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           Container(
                                               width: size.width * .23,
                                               height: size.height * .08,
                                               child: Text(
                                                 "${snapshot.data.result.orderDetails[index].viewStore}",
                                                 textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                   fontFamily: 'GE SS Two',
                                                   fontSize: 17,
                                                   fontWeight: FontWeight.w300,
                                                 ),
                                               )),  Container(
                                               width: size.width * .22,
                                               height: size.height * .08,
                                               child: Text(
                                                 "حالة الطلب",
                                                 textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                     color: Colors.grey, fontSize: 18),
                                               ))
                                         ],
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           top: 5.0, bottom: 5.0, right: 5),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           Container(
                                               width: size.width * .23,
                                               height: size.height * .08,
                                               child: Text(
                                                 "${snapshot.data.result.orderDetails[index].totalPrice}" '/'  "${snapshot.data.result.orderDetails[index].currencyName}",
                                                 textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                   fontFamily: 'GE SS Two',
                                                   fontSize: 17,
                                                   fontWeight: FontWeight.w300,
                                                 ),
                                               )),  Container(
                                               width: size.width * .22,
                                               height: size.height * .08,
                                               child: Text(
                                                 "اجمالي التكلفة",
                                                 textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                     color: Colors.grey, fontSize: 18),
                                               ))
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ]),
                         ),
                       ),
                     ),
                   );
                 }else{return Center (child: CircularProgressIndicator(),);}
               },
             );}
           else{
           return   Container(
             child: Center(child: Text("لا يوجد طلبات لديك حاليا",textDirection: TextDirection.rtl, style: TextStyle(
               fontFamily: 'GE SS Two',
               fontSize: 17,
               fontWeight: FontWeight.w300,
             ),),),
           );
           }



         }

          else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}
