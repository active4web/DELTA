import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delta/DataModel/register_list.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home/home_bar.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Repository _repo = Repository();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPassword2 = TextEditingController();
  bool  obscureText1=true;
  bool  obscureText2=true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_sharp),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("حساب جديد"),
            ],
          ),
          backgroundColor: Color(0xff3b6745),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width * .8,
                        child: TextField(
                          controller: controllerName,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "الاسم بالكامل",
                            hintStyle: TextStyle(
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
                          controller: controllerEmail,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "البريد الالكتروني",
                            hintStyle: TextStyle(
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
                          controller: controllerAddress,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.map),
                            hintText: "العنوان ",
                            hintStyle: TextStyle(
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
                          keyboardType: TextInputType.number,

                          controller: controllerPhone,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "رقم الجوال",
                            hintStyle: TextStyle(
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
                          textAlign: TextAlign.right,
                          obscureText: obscureText1,
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
                          hintText: "كلمة المرور ",
                          hintStyle: TextStyle(fontFamily: 'GE SS Two',
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
                          controller: controllerPassword2,
                          obscureText: obscureText2,
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
                                        obscureText2==false? obscureText2=true:  obscureText2=false;
                                      });
                                    },
                                    child: Icon(Icons.remove_red_eye_outlined)),

                              ],
                            ),
                            hintText: "تأكيد كلمة المرور",
                            hintStyle: TextStyle(
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
                decoration: BoxDecoration(
                            border: Border(),
                              ),
                              height: 50,
                              width: size.width * .72,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                   ),
                      width: size.width*.8,
                      child: _country!=null?
                      DropdownButton(
                        isExpanded: true,
                        items: _country.map((e) {
                          return new DropdownMenuItem(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: new Text(
                                  e.nameCity, style: TextStyle(
                                fontFamily: 'GE SS Two',
                                fontSize: 17,
                                color: const Color(0xff848484),
                                fontWeight: FontWeight.w300,
                              ),textDirection: TextDirection.rtl,)

                            ),
                            value:  e.idCity,
                          );
                        }).toList(),
                        onChanged: (val){
                          setState(() {
                            countryId=val;
                            print(countryId.toString());
                          });
                        },value:countryId ,
                      ):Container(),
                    ),)
                  ],
                ),
              ),
              // StreamBuilder<RegistrationListM>(
              //   stream: _repo.registerListCountry(key: '123456790',lang: 'ar').asStream(),
              //   builder: (context, snapshot) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Container(
              //               width: size.width * .8,
              //               child: DropdownButton<String>(
              //                 hint: Text(
              //                   'المدينة',
              //                   style: TextStyle(fontFamily: 'Cairo'),
              //                 ),
              //         value: dropdownValue,
              //         elevation: 30,
              //         style:  TextStyle(color: Colors.grey,),
              //         onChanged: (String newValue) {
              //           setState(() {
              //             dropdownValue = newValue;
              //           });
              //         },
              //         items:
              //         <String>['طرابلس', 'صبراتة', 'مصراتة', 'درنة',
              //           'طبرق','سرت','غدامس'].map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Container(
              //                 width: size.width * .7,
              //                 alignment: Alignment.centerRight,child: Text(value,textDirection: TextDirection.rtl,style:   TextStyle(
              //               fontFamily: 'GE SS Two',
              //               fontSize: 17,
              //               color: const Color(0xff848484),
              //               fontWeight: FontWeight.w300,
              //             ),)),
              //           );
              //         }).toList(),
              //       ),
              //               ),
              //         ],
              //       ),
              //     );
              //   }
              // ),

              //btn
           // StreamBuilder(
           //    stream: _repo.registerListCountry(key: '1234567890', lang: 'ar').asStream(),
           //        // future: _repo.registerListCountry(key: '1234567890', lang: 'ar'),
           //        builder: (context, snapshot) {
           //          if (snapshot.hasData) {
           //            RegistrationListM cat = snapshot.data;
           //            List<dropdownCountry> dropDownCat = [];
           //            for (var item in cat.result.listCountries) {
           //              dropDownCat
           //                  .add(dropdownCountry(item.idCity, item.nameCity));
           //            }
           //            dropdownValue = dropDownCat[0];
           //            return Container(
           //              decoration: BoxDecoration(
           //            border: Border(),
           //              ),
           //              height: 50,
           //              width: size.width * .72,
           //              child: Container(
           //                decoration: BoxDecoration(
           //                    color: Colors.white,
           //                   ),
           //                margin: EdgeInsets.all(1),
           //                padding: EdgeInsets.symmetric(horizontal: 5),
           //                child: Directionality(
           //                  textDirection: TextDirection.rtl,
           //                  child:
           //
           //
           //                  DropdownButton<dropdownCountry>(
           //                    hint: Text("اختر"),
           //                    underline: SizedBox(),
           //                    value: dropdownValue,
           //                    elevation: 30,
           //                    isExpanded: true,
           //                    style: const TextStyle(color: Colors.grey,fontSize: 17,),
           //                    onChanged: (dropdownCountry newValue) {
           //                      setState(() {
           //                        dropdownValue = newValue;
           //                        print(dropdownValue.name);
           //                        print(dropdownValue.id);
           //                      });
           //                    },
           //                    items: dropDownCat
           //                        .map<DropdownMenuItem<dropdownCountry>>(
           //                            (dropdownCountry value) {
           //                      return DropdownMenuItem<dropdownCountry>(
           //                        value: value,
           //                        onTap: (){
           //                          setState(() {
           //                            dropdownValue = value;
           //                          });
           //                        },
           //                        child: Directionality(
           //                            textDirection: TextDirection.rtl,
           //                            child: Container(
           //                                alignment: Alignment.centerRight,
           //                                child: Text(value.name, style: TextStyle(
           //                                  fontFamily: 'GE SS Two',
           //                                  fontSize: 17,
           //                                  color: const Color(0xff848484),
           //                                  fontWeight: FontWeight.w300,
           //                                ),textDirection: TextDirection.rtl,))),
           //                      );
           //                    }).toList(),
           //                  ),
           //                ),
           //              ),
           //            );
           //          } else {
           //            return Center(child: CircularProgressIndicator());
           //          }
           //        }),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  height: size.height * .06,
                  width: size.width * .8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height: size.height * 1, width: size.width * 1),
                    child: ElevatedButton(
                        child: Text(
                          'حساب جديد',
                          style: TextStyle(
                            fontFamily: 'GE SS Two',
                            fontSize: 17,
                            color:  Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: Color(0xfff3a005),
                          onPrimary: Colors.orangeAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () async{

                        String fb_id =await FirebaseMessaging.instance.getToken();
                          print(fb_id);
                         if(controllerPassword.text ==controllerPassword2.text)
                         {
                           _repo.registerAccount(
                               phone: controllerPhone.text,
                               key: '1234567890',
                               lang: 'ar',
                               email:controllerEmail.text ,
                               password: controllerPassword.text,
                               fullname: controllerName.text,
                               address: controllerAddress.text,
                               firebase_id: fb_id.toString(),
                               country: countryId.toString())
                               .then((value)async{
                             if(value.status!=false){
                               SharedPreferences pref = await SharedPreferences.getInstance();
                               pref.setString('phone', value.result.clientData[0].phone);
                               pref.setString('name', value.result.clientData[0].name);
                               pref.setBool('loginState', true);
                               pref.setBool('SliderState', true);
                               pref.setString('token', value.result.clientData[0].token);
                               await FirebaseFirestore.instance.collection("Users").doc().set({
                                 "phone":value.result.clientData[0].phone,
                                 "fr_id": fb_id,
                                 "name": value.result.clientData[0].name,
                                 "token": value.result.clientData[0].token,
                                 "email": controllerAddress.text,
                                 "password": controllerPassword.text
                               }).then((value) =>   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeBar())));
                             }
                             else{
                               var snackBar = SnackBar(content: Text('${value.message}'));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }
                           });
                         }
                         else{
                           var snackBar = SnackBar(content: Text('كلمة المرور غير متطابقة'));
                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                         }
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


  var baseurl = 'https://wasselni.ps/delta/';
  List _country;
  String countryId;
Dio dio=Dio();
  Future<RegistrationListM> country ({
    @required String key,
    @required String lang
  }) async {
    RegistrationListM data;
    FormData formData = new FormData.fromMap({
      "key": '1234567890',
       //"lang": 'ar'
    });
    await dio
        .post(
      baseurl + '/user_api/preparation_registeration',
      data: formData,
    )
        .then((value) {
      print('cczxcccccccccccccdone');
      print(value.data);
      data = RegistrationListM.fromMap(value.data);
    });
    setState(() {
      super.setState(() {
        _country=data.result.listCountries;
      });
      _country=data.result.listCountries;
    });
    return data;



  }
@override
  void initState() {
  super.initState();
this.country();
  }
}


