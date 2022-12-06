import 'package:delta/Screen/Home/home_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DataModel/FormsModels/set_replayM.dart';
import '../Repository/Repository.dart';
import 'Home/home_page.dart';

class SendDone extends StatefulWidget {
  SendDone({Key key,this.message, this.token, this.cat_id}) : super(key: key);
  String cat_id;
  String token;
  String message;
  @override
  _SendDoneState createState() => _SendDoneState();
}




class _SendDoneState extends State<SendDone> {

  // String message;
  // var baseurl = 'https://mdecco.com/app/';
  // String token  ;



  // Future<Null> gettoken() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState((){
  //     token = pref.getString("token");
  //   });
  // }


  // Dio dio = Dio();
  // Future<SetReplay> done({
  //   @required String key,
  //   @required String token_id,
  //   @required String cat_id,
  // }) async {
  //   SetReplay data;
  //   FormData formData = new FormData.fromMap(
  //       {"key": key, "token_id": token_id, "cat_id": cat_id});
  //   await dio
  //       .post(
  //     baseurl + '/user_api/set_replay',
  //     data: formData,
  //   )
  //       .then((value) {
  //     print('done');
  //     print(value.data);
  //     data = SetReplay.fromJson(value.data);
  //   });
  //   setState(() {
  //     message = data.message;
  //   });
  //   return data;
  // }
  // @override
  // void initState() {
  //   // token="";
  //   //  gettoken();
  //   super.initState();
  //   this.done(
  //       key: '1234567890', token_id: widget.token, cat_id: widget.cat_id);
  // }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;



    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: sWidth * .5,
                    height: sWidth * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Icon-check.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: size.width * .8,
                          height: size.height * .1,
                          child: Text(
                            "${widget.message}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                             // fontSize: 19,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: size.height * .06,
              width: size.width * .35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    height: size.height * 1, width: size.width * 1),
                child: ElevatedButton(
                    child: Text(
                      "انهاء",
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
                          borderRadius:
                          BorderRadius.all(Radius.circular(15))),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeBar()));
                    }),
              ),
            ),
          ],
        ));

  }
}
// Scaffold(
// body:Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: Container(
// width: sWidth * .5,
// height: sWidth * .5,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(
// Radius.elliptical(9999.0, 9999.0)),
// image: DecorationImage(
// image: const AssetImage('assets/images/Icon-check.png')
// ,
// fit: BoxFit.cover,
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// width: size.width * .8,
// height: size.height * .1,
// child: Text(
// "ghjk",
// style: TextStyle(
// fontFamily: 'GE SS Two',
// fontSize: 19,
// fontWeight: FontWeight.w300,
// ),)
// ),
// ],
// ),
// ),
// ],
//
// ),
// Container(
// height: size.height * .06,
// width: size.width * .35,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius:
// BorderRadius.all(Radius.circular(15))),
// child: ConstrainedBox(
// constraints: BoxConstraints.tightFor(
// height:size.height * 1, width: size.width * 1),
// child: ElevatedButton(
// child: Text(
// "انهاء",
// style:   TextStyle(
// fontFamily: 'GE SS Two',
// fontSize: 17,
// color: const Color(0xff848484),
// fontWeight: FontWeight.w300,
// ),
// ),
// style: ElevatedButton.styleFrom(
// elevation: 20,
// primary:  Color(0xfff3a005),
// onPrimary: Colors.orangeAccent,
// shape: const RoundedRectangleBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(15))),
// ),
// onPressed: () {
//
// Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeBar()));
// }
// ),
// ),
// ),
// ],
// )
//
// );
