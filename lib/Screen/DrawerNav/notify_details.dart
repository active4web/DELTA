import 'package:delta/DataModel/notify_detailsM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';
import 'notifications.dart';

class NotifyDetails extends StatefulWidget {
   NotifyDetails({Key key,this.notifyId}) : super(key: key);
    String notifyId;
  @override
  _NotifyDetailsState createState() => _NotifyDetailsState();
}

class _NotifyDetailsState extends State<NotifyDetails> {
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
          onPressed: () =>Navigator.push(context,
              MaterialPageRoute(builder: (_) => Notify())),
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
              "تفاصيل الاشعارات",
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
      body: StreamBuilder<NotifyDetailsM>(
          stream: _repo.getNotifyDetails(id_notify: widget.notifyId,key: '1234567890', token_id: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjMiLCJwaG9uZSI6IjAxMDE1NjU0MzI5IiwiZW1haWwiOiJzbWlsZS5AZ21haWwuY29tICIsIkFQSV9USU1FIjoxNjI0NTQxMzgxfQ.6VWpwiAGH_IhN-_WC_qbe4FcQPD09edtDNNWegtBjvw',).asStream(),
          builder: (context, snapshot) {
            if(snapshot.data!=null){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Card(
                    elevation: 7,
                      child:
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image:DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data.result.notificationDetails.img,
                                    )),
                                border: Border.all(
                                    color: Colors.green),
                                borderRadius: BorderRadius.all(

                                    Radius.circular(1))),
                            width: size.width*.4,
                            height: size.width*.4,
                            child:
                            Image.network(
                              snapshot.data.result.notificationDetails.img,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: size.width*.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 2.0, right: 2),
                                  child: Container(
                                      width: size.width * .2,
                                      height: size.height * .1,
                                      child: Text(
                                        "${snapshot.data.result.notificationDetails.createdAt.toString().substring(0,10)}",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            color: Color(0xff0f0f10), fontSize: 13),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 2.0, right: 2),
                                  child: Container(
                                      width: size.width * .57,
                                      height: size.height * .1,
                                      child: Text(
                                        "${snapshot.data.result.notificationDetails.title}",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            color: Color(0xff0b4079), fontSize: 18),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 2.0, right: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: size.width * .8,
                                    height: size.height * .15,


                                    child: Text(
                                      "${snapshot.data.result.notificationDetails.body}",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Color(0xff0f0f10), fontSize: 13),
                                    ))
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              );
            }else{return Center(child: CircularProgressIndicator(),);}
          }
      ),);
  }

}
