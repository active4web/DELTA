import 'package:delta/DataModel/totify_listM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import 'notify_details.dart';
class Notify extends StatefulWidget {
  const Notify({Key key}) : super(key: key);

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  String token;

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
                "الاشعارات",
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
        //'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjMiLCJwaG9uZSI6IjAxMDE1NjU0MzI5IiwiZW1haWwiOiJzbWlsZS5AZ21haWwuY29tICIsIkFQSV9USU1FIjoxNjI0NTQxMzgxfQ.6VWpwiAGH_IhN-_WC_qbe4FcQPD09edtDNNWegtBjvw'
        body: StreamBuilder<NotifyListM>(
          stream: _repo.get_Notify(key: '1234567890', token_id: token, limit: '20', page_number: '0').asStream(),
          builder: (context, snapshot) {
       if(snapshot.data!=null){
         if(snapshot.data.result.allNotifications!=[]){
           return ListView.builder(
             shrinkWrap: true,
             physics: ScrollPhysics(),
             itemCount: snapshot.data.result.allNotifications.length,
             itemBuilder: (context, index) {
               return SingleChildScrollView(
                 child: GestureDetector(
                   onTap: (){

                     Navigator.push(context, MaterialPageRoute(builder: (_)=>NotifyDetails(notifyId: snapshot.data.result.allNotifications[index].id.toString(),)));
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                       color:   snapshot.data.result.allNotifications[index].isRead != 1  ? Colors.orange :  Colors.white,
                       elevation: 5,
                       child:
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Container(
                               width: size.width*.75,
                               child: Column(
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       GestureDetector(
                                          onTap: (){
                                            _repo.del_Notify(key: '1234567890', token_id: token, id_notfy: snapshot.data.result.allNotifications[index].id.toString()).then((value) {
                                              if(value.status=true){
                                                var snackBar = SnackBar(content: Text(value.message));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }
                                            });
                                          },
                                         child: Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child:
                                           Container(
                                             width: size.width*.06,
                                             height: size.width*.06,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.all(
                                                     Radius.elliptical(9999.0, 9999.0)),
                                                 image:DecorationImage(
                                                     fit: BoxFit.fill,
                                                     image: AssetImage('assets/images/del.png')

                                                 )),
                                           ),
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Container(
                                             width: size.width * .18,
                                             height: size.height * .02,
                                             child: Text(
                                               "${snapshot.data.result.allNotifications[index].createdAt.toString().substring(0,10)}",
                                               textDirection: TextDirection.rtl,
                                               style: TextStyle(
                                                   color: Color(0xff0f0f10), fontSize: 13),
                                             )),
                                       ),
                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                           width: size.width * .6,
                                           height: size.height * .1,
                                           alignment: Alignment.centerRight,
                                           child: Text(
                                             "${snapshot.data.result.allNotifications[index].title}",
                                             textDirection: TextDirection.rtl,
                                             style: TextStyle(
                                                 color: Color(0xff0b4079), fontSize: 18),
                                           )
                                       )
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Expanded(
                               child:
                               Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(
                                       Radius.elliptical(9999.0, 9999.0)),
                                   image:DecorationImage(
                                       fit: BoxFit.fill,
                                       image: snapshot.data.result.allNotifications[index].img==""?AssetImage('assets/images/Icon-check.png'):NetworkImage(
                                         snapshot.data.result.allNotifications[index].img,

                                       )),

                                 ),
                                 width: size.width*.2,
                                 height: size.width*.2,
                                 // child:
                                 // Image.network(
                                 //   snapshot.data.result.allCategories[i].categoryImage,
                                 //   fit: BoxFit.fill,
                                 // ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
               );
             },
           );
         }
         else{return
           Container(
             child:Center(child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("لا يوجد اشعارات",   style:   TextStyle(
                   fontFamily: 'GE SS Two',
                   fontSize: 25,
                   color: const Color(0xff3b6745),
                   fontWeight: FontWeight.w300,
                 ),),
               ],
             ))
         );}

       }else{return Center(child: CircularProgressIndicator(),);}
          }
        ),);
  }
}
