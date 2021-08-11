import 'package:carousel_slider/carousel_slider.dart';
import 'package:delta/DataModel/ArticleM.dart';
import 'package:delta/DataModel/atricle_cat.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/designs.dart';
import 'package:delta/Screen/Home/order_track.dart';
import 'package:flutter/material.dart';
import 'package:delta/DataModel/atricle_cat.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:delta/custom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import '../login.dart';
import 'about_app.dart';
import 'blogs.dart';
import 'contact_us.dart';
import 'not_logged_in.dart';
import 'notifications.dart';
import '../Home/projectDetails.dart';
import 'profile.dart';
import 'technical_support.dart';

class Articles extends StatefulWidget {
  String articleId;
  Articles({Key key,this.articleId}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  Repository _repo = Repository();
  String token;
  List <Widget> itemSliders =[];
  Future <String> gettoken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }
  @override
  void initState()  {
    gettoken();
    print("idxxxx " + widget.articleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
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
                builder: (context) =>
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 6.0, right: 10.0),
                      child: IconButton(
                        icon: ImageIcon(
                          AssetImage("assets/images/menu.png"),
                          size: 25,
                        ),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        tooltip: MaterialLocalizations
                            .of(context)
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
        endDrawer: NewWidget(size: size, token: token),
        body:      StreamBuilder<ArticleM>(
          stream: _repo.getArticle(token_id: token, key: '1234567890', article_id: widget.articleId).asStream(),
          builder: (context, snapshot) {
             if(snapshot.data!=null)
       {
         for (int i = 0; i < snapshot.data.result.allSlider.length; i++) {
           itemSliders.add(Padding(
               padding: const EdgeInsets.all(2.0),
               child: Container(
                   width: MediaQuery.of(context).size.width,
                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.amber),
                   child: GestureDetector(
                     onTap: ()async{
                     },
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                       child: Image.network(
                         snapshot.data.result.allSlider[i].img,
                         fit: BoxFit.fill,
                       ),
                     ),
                   ))));
         }

         return SingleChildScrollView(
         child: Column(children: [
           Padding(
             padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   alignment: Alignment.topCenter,
                   width: size.width,
                   height: size.height*.22,
                   child:null??   ClipRRect (
                     borderRadius: BorderRadius.circular(20),
                     child: CarouselSlider(
                       items: itemSliders,
                       options: CarouselOptions(
                         autoPlay: true,
                         viewportFraction: .95,
                         aspectRatio: 2,
                         height: size.height * .35,
                         enlargeCenterPage: true,
                       ),
                     ),
                   ),

                 ),
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
                     child: Text("${snapshot.data.result.articlesDetails.articleName}",textDirection: TextDirection.rtl,style:TextStyle(color: Color(
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
                     child: Text("${snapshot.data.result.articlesDetails.creationDate}",textDirection: TextDirection.rtl,style:TextStyle(color: Color(
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
                     height: size.height * .22,
                     child:Text("${snapshot.data.result.articlesDetails.details}",textDirection: TextDirection.rtl,style:TextStyle(color: Color(
                         0xff0b4079),fontSize: 18),)
                 )
               ],
             ),
           ),
         ]),
       );}
            else{return Center(child: CircularProgressIndicator(),);}
          }
        ));

   
  }
}
