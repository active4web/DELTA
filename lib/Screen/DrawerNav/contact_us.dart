import 'package:delta/DataModel/contact_infoM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String token;
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerContent = TextEditingController();

  Future <Null> gettoken() async{
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
                "تواصل معنا",
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
        body: StreamBuilder<ContactInfoM>(
          stream: _repo.getContact(token_id: token, key: "1234567890").asStream(),
          builder: (context, snapshot) {
            if(snapshot.data!=null){ return SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * .5,
                        height: size.height * .12,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10, bottom: 1.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .05,
                          child: Text(
                            "تواصل معنا",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0, bottom: 1.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .05,
                          child: Text(
                            "${snapshot.data.result.address}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              // fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0, bottom: 8.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .05,
                          child: Text(
                            "${snapshot.data.result.hotline}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              // fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0, bottom: 1.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .05,
                          child: Text(
                            "${snapshot.data.result.supportEmail}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              // fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0, bottom: 1.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .05,
                          child: Text(
                            "${snapshot.data.result.websiteLink}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              // fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0, bottom: 1.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .05,
                          child: Text(
                            "${snapshot.data.result.supportPhone}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              // fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                ),


                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0, bottom: 1.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Utils.openLink(url: 'https://web.whatsapp.com/send?phone=${snapshot.data.result.whatsapp}');
                        },
                        child: Container(
                          width: size.height * .05,
                          height: size.height * .05,
                          child: Image.asset(
                            "assets/images/whatsapp.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Utils.openLink(url: '${snapshot.data.result.twitter}');
                        },
                        child: Container(
                          width: size.height * .05,
                          height: size.height * .05,
                          child: Image.asset(
                            "assets/images/twitter.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Utils.openLink(url: '${snapshot.data.result.linkedin}');
                        },
                        child: Container(
                          width: size.height * .05,
                          height: size.height * .05,
                          child: Image.asset(
                            "assets/images/linked.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Utils.openLink(url: '${snapshot.data.result.facebook}');
                        },
                        child: Container(
                          width: size.height * .05,
                          height: size.height * .05,
                          child: Image.asset(
                            "assets/images/facebook.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 8.0,right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * .5,
                        height: size.height * .05,
                        child:Text(
                          "أسألنا أي شئ في اي وقت",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'GE SS Two',
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        width: size.width * .8,
                        height: size.height * .06,
                        color: Colors.white38,
                        child: TextField(
                          controller: controllerName,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'الاسم',hintTextDirection: TextDirection.rtl,
                                hintStyle:TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.person)
                            ),
                            textDirection: TextDirection.rtl
                        ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * .8,
                        height: size.height * .06,
                        color: Colors.white38,
                        child: TextField(
                          controller: controllerPhone,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'الهاتف',hintTextDirection: TextDirection.rtl,
                                hintStyle:TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.email)
                            ),
                            textDirection: TextDirection.rtl
                        ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * .8,
                        height: size.height * .19,
                        color: Colors.white38,
                        child: TextField(
                          controller: controllerContent,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'الرسالة',hintTextDirection: TextDirection.rtl,
                            hintStyle:TextStyle(color: Colors.grey),
                            //    prefixIcon: Icon(Icons.email)
                          ),
                          textDirection: TextDirection.rtl,
                          maxLines: 7,
                        ),)
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
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          height:size.height * 1, width: size.width * 1),
                      child: ElevatedButton(
                          child: Text(
                            'ارسال',
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
                                BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () async{

                            if(controllerContent.text!=""&&controllerContent.text!=null
                            &&controllerPhone.text!=""&&controllerPhone.text!=null
                            &&controllerName.text!=""&&controllerName.text!=null)
                            {
                             _repo.messageSentReply(key: '1234567890', token_id: token, name: controllerName.text, phone: controllerPhone.text, message: controllerContent.text)
                                 .then((value) {
                             if  (value.status!=false){
                               var snackBar = SnackBar(content: Text('${value.message}'));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               setState(() {
                                 controllerName.text='';
                                 controllerPhone.text='';
                                 controllerContent.text='';
                               });
                               }else{
                               var snackBar = SnackBar(content: Text('${value.message}'));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }

                             });
                            }else{ var snackBar = SnackBar(content: Text('من فضلك قم بادخال البيانات صحيحة'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);}
                          }
                      ),
                    ),
                  ),
                ),
              ]),
            );}
           else{return  Center(child: CircularProgressIndicator(backgroundColor: Colors.green,),);}
          }
        ));
  }
}
