import 'dart:async';

import 'package:delta/Repository/Repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home/home_bar.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

Repository _repo = Repository();
//TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPhone = TextEditingController();
TextEditingController controllerPassword = TextEditingController();


class _LoginState extends State<Login> {
  bool obscureText1=true;
  @override
  void initState() {
    Timer(Duration(seconds: 0), () async {
      SharedPreferences preferences;
      preferences = await SharedPreferences.getInstance();
      print(preferences.getBool("loginState"));
      if (preferences.getBool("loginState") != null) {
        if (preferences.getBool("loginState")) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                       HomeBar()
                   ));
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("تسجيل الدخول"),
          centerTitle: true,
          backgroundColor: Color(0xff3b6745),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .5,
                      height: size.height * .17,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fill,),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width * .8,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: controllerPhone,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "الهاتف",
                            hintStyle:TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              color: const Color(0xff848484),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width * .8,
                        child: TextField(
                          controller: controllerPassword,

                          obscureText: obscureText1,
                          enableSuggestions: false,
                          autocorrect: false,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.lock),
                                GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        obscureText1==false? obscureText1=true:  obscureText1=false;
                                      });
                                    },
                                    child: Icon(Icons.remove_red_eye_outlined)),

                              ],
                            ),
                            hintText: "كلمة المرور",
                            hintStyle:TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 17,
                              color: const Color(0xff848484),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(020.0),
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                    },
                    child:Text(" تسجيل حساب جديد",  style:TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 19,
                      color: const Color(0xff848484),
                      fontWeight: FontWeight.w300,
                    ),)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                        'تسجيل الدخول',
                        style:   TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 17,
                        color: const Color(0xfffcfbfb),
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
                      onPressed: ()async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        String fbToken =await FirebaseMessaging.instance.getToken();
                        print( fbToken);
                        if(controllerPassword.text!=null||controllerPassword.text!='')
                    { if(controllerPhone.text!=null||controllerPhone.text!='') {
                      if (controllerPhone.text != null &&
                          controllerPassword.text != null &&
                          controllerPhone.text != '' &&
                          controllerPassword.text != '') {
                        _repo.loginAccount(phone: controllerPhone.text,
                            password: controllerPassword.text,
                            firebase_id: fbToken,
                            key: "1234567890")
                            .then((value)
                        {

                          if ( value.status == false) {
                            // Timer(Duration(seconds: 0), () async {
                            //   SharedPreferences preferences;
                            //   preferences = await SharedPreferences.getInstance();
                            //   print(preferences.getBool("loginState"));
                            //   if (preferences.getBool("loginState") != null) {
                            //     if (preferences.getBool("loginState")) {
                            //       showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) {
                            //           return alert;
                            //         },
                            //       );
                            //     }
                            //   }
                            // });

                            print("ggh${value.message}");
                             String c=value.message;
                            var  snackBar =  SnackBar(
                                content: Text(c));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
                          } else {
                            preferences.setBool('loginState', true);
                            preferences.setBool('SliderState', true);
                            preferences.setString(
                                "phone", value.result.clientData[0].phone);
                            preferences.setString(
                                "token", value.result.clientData[0].token);
                            preferences.setString(
                                "name", value.result.clientData[0].fullname);
                            preferences.setString("id",
                                value.result.clientData[0].id.toString());
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => HomeBar()));

                          }
                        });

                      } else {
                        var snackBar = SnackBar(content: Text(
                            'خطأ في رقم الهاتف او كلمة المرور '));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }else{
                      var snackBar = SnackBar(content: Text(
                          ' من فضلك ادخل رقم الهاتف  '));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    }else{   var snackBar = SnackBar(content: Text(
                            ' من فضلك ادخل كلمة المرور  '));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);}
                      }
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
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
                          'تخطي',
                          style:   TextStyle(
                            fontFamily: 'GE SS Two',
                            fontSize: 17,
                            color: const Color(0xfffcfbfb),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary:  Color(0xff61a1e2),
                          onPrimary: Colors.orangeAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: ()async {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeBar()));
                        }
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );

  }
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
    ],
  );



}