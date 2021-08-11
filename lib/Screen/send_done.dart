



import 'package:delta/Screen/Home/home_bar.dart';
import 'package:flutter/material.dart';

import 'Home/home_page.dart';

class SendDone extends StatefulWidget {
  const SendDone({Key key}) : super(key: key);

  @override
  _SendDoneState createState() => _SendDoneState();
}

class _SendDoneState extends State<SendDone> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var sHeight = MediaQuery
        .of(context)
        .size
        .height;
    var sWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(

      body:Column(
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
                      image: const AssetImage('assets/images/Icon-check.png')
                      ,
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
                      child: Text("تم استلام النموذج بنجاح و سنرسل لكم عرضنا بالخصوص في اقرب وقت ممكن", style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                      ),)
                    ),
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
                borderRadius:
                BorderRadius.all(Radius.circular(15))),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  height:size.height * 1, width: size.width * 1),
              child: ElevatedButton(
                  child: Text(
                    "انهاء",
                    style:   TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      color: const Color(0xff848484),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    primary:  Color(0xfff3a005),
                    onPrimary: Colors.orangeAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeBar()));
                  }
              ),
            ),
          ),
        ],
      )

    );
  }
}
