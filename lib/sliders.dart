import 'dart:async';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DataModel/introM.dart';
import 'Screen/login.dart';

class IntroScreen extends StatefulWidget {

  @override
  IntroScreenState createState() => new IntroScreenState();
}

// ------------------ Custom config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  int netimg = 0;
  var myStream;

  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool? sliderState = preferences.getBool("SliderState");

      // Print the value (for debugging purposes)
      debugPrint('SliderState: $sliderState');

      // Check if the value is not null and is true
      if (sliderState != null && sliderState) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeBar()),
        );
      }
    });
  }

  // void initState() {
  //   Timer(Duration(seconds: 0), () async {
  //     SharedPreferences preferences;
  //     preferences = await SharedPreferences.getInstance();
  //     print(preferences.getBool("SliderState"));
  //     if (preferences.getBool("SliderState") != null) {
  //       if (preferences.getBool("SliderState")) {
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => HomeBar()));
  //       }
  //     }
  //   });
  //   super.initState();
  // }

  void onDonePress() {
    //  Do what you want
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }

  Repository _repo = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<IntroM>(
        stream: _repo.getIntro(key: '1234567890').asStream(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            slides.add(
              Slide(
                marginTitle: EdgeInsets.zero,
                backgroundColor: Colors.white,
                widgetTitle: Column(
                  children: [
                    snapshot.data?.result?.txtImg1 == null ||
                            snapshot.data?.result?.txtImg1 == ''
                        ? Container(
                            width: MediaQuery.of(context).size.width * .8,
                            height: MediaQuery.of(context).size.height * .8,
                            child: Image.asset(
                              "assets/images/Mask1.png",
                              fit: BoxFit.fill,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data?.result?.txtImg1??"",
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${snapshot.data?.result?.titleT1}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 30,
                          color: const Color(-384871238),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Text(
                        "${snapshot.data?.result?.txtT1}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 18,
                          color: const Color(-384871238),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                directionColorBegin: Alignment.topLeft,
                directionColorEnd: Alignment.bottomRight,
              ),
            );
            slides.add(
              Slide(
                marginTitle: EdgeInsets.zero,
                widgetTitle: Column(
                  children: [
                    snapshot.data?.result?.txtImg3 == null ||
                            snapshot.data?.result?.txtImg == ''
                        ? Container(
                            width: MediaQuery.of(context).size.width * .8,
                            height: MediaQuery.of(context).size.width * .8,
                            child: Image.asset(
                              "assets/images/Mask1.png",
                              fit: BoxFit.fill,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data?.result?.txtImg??"",
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${snapshot.data?.result?.titleT2}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 30,
                          color: const Color(-384871238),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Text(
                        "${snapshot.data?.result?.txtT2}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 18,
                          color: const Color(-384871238),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                directionColorBegin: Alignment.topLeft,
                directionColorEnd: Alignment.bottomRight,
                onCenterItemPress: () {},
              ),
            );
            slides.add(
              Slide(
                marginTitle: EdgeInsets.zero,
                widgetTitle: Column(
                  children: [
                    snapshot.data?.result?.txtImg3 == null ||
                            snapshot.data?.result?.txtImg3 == ''
                        ? Container(
                            width: MediaQuery.of(context).size.width * .8,
                            height: MediaQuery.of(context).size.width * .8,
                            child: Image.asset(
                              "assets/images/Mask1.png",
                              fit: BoxFit.fill,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data?.result?.txtImg3??"",
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${snapshot.data?.result?.titleT3}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 30,
                          color: const Color(-384871238),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Text(
                        "${snapshot.data?.result?.txtT3}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 18,
                          color: const Color(-384871238),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                directionColorBegin: Alignment.topLeft,
                directionColorEnd: Alignment.bottomRight,
                onCenterItemPress: () {},
              ),
            );
            return new IntroSlider(
              // List slides
              slides: this.slides,

              // Skip button
              renderSkipBtn: this.renderSkipBtn(),
              skipButtonStyle: myButtonStyle(),

              // Next button
              renderNextBtn: this.renderNextBtn(),
              nextButtonStyle: myButtonStyle(),

              // Done button
              renderDoneBtn: this.renderDoneBtn(),
              onDonePress: this.onDonePress,
              doneButtonStyle: myButtonStyle(),

              // Dot indicator
              colorDot: Color(0x33FFA8B0),
              colorActiveDot: Color(0xffFFA8B0),
              sizeDot: 13.0,

              // Show or hide status bar
              hideStatusBar: true,
              backgroundColorAllSlides: Colors.grey,

              // Scrollbar
            //  verticalScrollbarBehavior: scrollbarBehavior.HIDE,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
