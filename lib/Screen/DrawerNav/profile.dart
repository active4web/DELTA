import 'package:delta/DataModel/profile_infoM.dart';
import 'package:delta/DataModel/register_list.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';


class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String token;
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
  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController addressController=TextEditingController();
  Future<Null> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }
  @override
  void initState() {
    token = "";
    this.country();
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
                  margin: EdgeInsets.only(top: 8.0, right: 10.0),
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
                "البروفايل",
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
        body: StreamBuilder<ProfileInfoM>(
          stream: _repo.proInfo(key: '1234567890', token_id: token).asStream(),
          builder: (context, snapshot) {
    if(snapshot.data!=null)
    {
      return SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width * .5,
              height: size.height * .17,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * .8,
                  height: size.height * .06,
                  color: Colors.white,
                  child: TextField(
                    controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '${snapshot.data.result.customerInfo.name}',
                          hintTextDirection: TextDirection.rtl,

                          prefixIcon: Icon(Icons.person)),
                      textDirection: TextDirection.rtl),
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
                  color: Colors.white,
                  child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '${snapshot.data.result.customerInfo.email}',
                          hintTextDirection: TextDirection.rtl,
                          prefixIcon: Icon(Icons.mail)),

                      textDirection: TextDirection.rtl),
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
                  color: Colors.white,
                  child: TextField(
                    controller: addressController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '${snapshot.data.result.customerInfo.address}',
                          hintTextDirection: TextDirection.rtl,
                          prefixIcon: Icon(Icons.map)),

                      textDirection: TextDirection.rtl),
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
                  color: Colors.white,
                  child: TextField(
                    controller: phoneController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          hintText: '${snapshot.data.result.customerInfo.phone}', hintTextDirection: TextDirection.rtl,
                          prefixIcon: Icon(Icons.phone)
                      ),
                      textDirection: TextDirection.rtl),
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
                  color: Colors.white,
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '************',
                          enabled: false,
                          hintTextDirection: TextDirection.rtl,
                          prefixIcon: Icon(Icons.lock)
                      ),
                      textDirection: TextDirection.rtl),
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
                  decoration: BoxDecoration(
                    border: Border(),
                  ),
                  height: 50,
                  width: size.width * .8,
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
                      'تعديل',
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
                      if(nameController.text!=""&&phoneController.text!=""&&addressController.text!=""
                      &&countryId!=null&&emailController.text!=""
                      )
                        {
                          _repo.editPro(key: '1234567890', token_id: token, fullname: nameController.text, phone: phoneController.text, address: addressController.text, country: countryId, email: emailController.text)
                              .then((value) {
                        if(value.status!=false)
                        {
                          var snackBar =  SnackBar(
                              content: Text(" تم تعديل البيانات بنجاح"));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeBar()));
                        }else{
                          var snackBar =  SnackBar(
                              content: Text("${value.message}"));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                        }
                          });
                        }else{
                        var snackBar =  SnackBar(
                            content: Text("من فضلك قم بادخال جميع البيانات"));
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar);
                      }
                      SharedPreferences preferences = await SharedPreferences.getInstance();

                    }
                ),
              ),
            ),
          ),

        ]),
      );
    }else
          {
      return Center(child: CircularProgressIndicator(),);
    }
          }
        ));
  }
}

