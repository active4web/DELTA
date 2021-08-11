import 'package:delta/DataModel/atricle_cat.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/Screen/Home/order_track.dart';
import 'package:delta/custom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import '../login.dart';
import 'about_app.dart';
import 'articls.dart';
import 'blogs.dart';
import 'contact_us.dart';
import 'not_logged_in.dart';
import 'notifications.dart';
import '../Home/projectDetails.dart';
import 'profile.dart';
import 'technical_support.dart';



class Blogs extends StatefulWidget {
  const Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}
int initPosition=0;
class _BlogsState extends State<Blogs> {
  String token;

  List  itemCat =[];

  Future <String> gettoken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }
  @override
  void initState()  {
    gettoken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Repository _repo = Repository();
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
                "قسم الاخبار والمدونات",
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
        body: StreamBuilder<ArticleCatM>(
          stream: _repo.getArticleCat(token_id: token, key: '1234567890').asStream(),
          builder: (context, snapshot) {
            if(snapshot.data != null){
              return CustomTabView(
                  initPosition: initPosition,
                  onPositionChange: (index){
                 setState(() {

                   initPosition = index;
                 });
                    print('current position: $index');
                    initPosition = index;
                  },
                  itemCount: snapshot.data.result.allCategories.length
                  , tabBuilder: (context, index) =>Tab(text : "${snapshot.data.result.allCategories[index].categoryName}"),
                  pageBuilder: (context, index,) =>
                  StreamBuilder<ArticleCatM>(
                      stream: _repo.getArticleCat(token_id: token, key: '1234567890').asStream(),
                      builder: (context, snapshot) {
                      if(snapshot.data!=null )
                        {
                          if(snapshot.hasError || snapshot.data.result.allCategories[initPosition].allArticles.length != null)
                         {return    ListView.builder(
                           shrinkWrap: true,
                           physics: ScrollPhysics(),
                           itemCount: snapshot.data.result.allCategories[initPosition].allArticles.length,
                           itemBuilder: (context, index2) {
                             return SingleChildScrollView(
                               child: Column(children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                         width: size.width * .88,
                                         height: size.height * .2,
                                         child: Image.asset(
                                           "assets/images/blogpic.png",
                                           fit: BoxFit.fill,
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 30.0, bottom: 8.0,right: 20),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Container(
                                           width: size.width * .35,
                                           height: size.height * .03,
                                           child: Text("${snapshot.data.result.allCategories[index].allArticles[index2].productName}",textDirection: TextDirection.rtl,style:TextStyle(color: Color(
                                               0xff0b4079),fontSize: 15),)
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 2.0, bottom: 8.0,right: 20),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Container(
                                           width: size.width * .2,
                                           height: size.height * .02,
                                           child: Text("22-5-2021",textDirection: TextDirection.rtl,style:TextStyle(color: Color(
                                               0xff0f0f10),fontSize: 13),)
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 5.0, bottom: 8.0,right: 25),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Container(
                                           width: size.width * .8,
                                           height: size.height * .19,
                                           child:Text("${snapshot.data.result.allCategories[index].allArticles[index2].smallDescription}",textDirection: TextDirection.rtl,style:TextStyle(color: Color(
                                               0xff0b4079),fontSize: 18),)
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Container(
                                         height: size.height * .06,
                                         width: size.width * .3,
                                         decoration: BoxDecoration(
                                             color: Colors.white,
                                             borderRadius:
                                             BorderRadius.all(Radius.circular(1))),
                                         child: ConstrainedBox(
                                           constraints: BoxConstraints.tightFor(
                                               height:size.height * 1, width: size.width * 1),
                                           child: ElevatedButton(
                                               child: Text(
                                                 'اقرأ المزيد',
                                                 style:   TextStyle(
                                                   fontFamily: 'GE SS Two',
                                                   fontSize: 17,
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
                                                     BorderRadius.all(Radius.circular(2))),
                                               ),
                                               onPressed: () {
                                                 Navigator.push(context, MaterialPageRoute(builder: (_)=>Articles(articleId:snapshot.data.result.allCategories[index].allArticles[index2].prodId.toString() ,)));
                                               }
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),

                               ]),
                             );},
                         ); }
                        else{  return Center(child:Text("لا يوجد بيانات"));}
                        }
                       else{return Center(child: CircularProgressIndicator());}
                    }
                  ));
            }else{return Center(child: CircularProgressIndicator(),);}

          }
        ));
  }
}
