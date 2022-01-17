import 'package:delta/Screen/DrawerNav/about_app.dart';
import 'package:delta/Screen/DrawerNav/blogs.dart';
import 'package:delta/Screen/DrawerNav/contact_us.dart';
import 'package:delta/Screen/DrawerNav/notifications.dart';
import 'package:delta/Screen/DrawerNav/our_projects.dart';
import 'package:delta/Screen/DrawerNav/profile.dart';
import 'package:delta/Screen/DrawerNav/technical_support.dart';
import 'package:flutter/material.dart';

import '../send_done.dart';
import 'package:delta/Screen/Home/home_bar.dart';
import 'package:flutter/material.dart';

class ResidentalDesign extends StatefulWidget {
  const ResidentalDesign({Key key}) : super(key: key);

  @override
  _ResidentalDesignState createState() => _ResidentalDesignState();
}

enum SingingCharacter4 { classic, modern }
SingingCharacter4 _character_design = SingingCharacter4.modern;

enum SingingCharacter3 { yes, no }
SingingCharacter3 _character_living = SingingCharacter3.yes;

enum SingingCharacterneighbor { yes, no }
SingingCharacterneighbor _character_neighbor = SingingCharacterneighbor.yes;

enum SingingCharacterpool { yes, no }
SingingCharacterpool _character_pool = SingingCharacterpool.yes;

enum SingingCharacterArchDesign { yes, no }
SingingCharacterArchDesign _character_ArchDesign =
    SingingCharacterArchDesign.yes;

enum SingingCharacterLoc { yes, no }
SingingCharacterLoc _character_Loc = SingingCharacterLoc.yes;

enum SingingCharacterKitchen { open, close }
SingingCharacterKitchen _character_kitchen = SingingCharacterKitchen.open;

enum SingingCharacter { bathroom, no_bathroom }
SingingCharacter _character_bath = SingingCharacter.bathroom;

enum SingingCharacterPoolSide { inside, outside }
SingingCharacterPoolSide _character_PoolSide = SingingCharacterPoolSide.inside;

enum SingingCharacterGarden { no, yes }
SingingCharacterGarden _character_Garden = SingingCharacterGarden.yes;

enum SingingCharacterDirection { north, South, east, West }
SingingCharacterDirection _character_Direction =
    SingingCharacterDirection.north;

enum SingingCharacterSystem {
  hurudi,
  fungal_slab,
  Solid_slab,
  Flat_slabs_for_large_spaces
}
SingingCharacterSystem _character_System = SingingCharacterSystem.hurudi;

enum SingingCharacterHurudi { pumice, Bajaur, Bumchi }
SingingCharacterHurudi _character_hurudi = SingingCharacterHurudi.pumice;

enum SingingCharacterWall { Separators, Bumchi, Block, Concrete }
SingingCharacterWall _character_wall = SingingCharacterWall.Separators;

class _ResidentalDesignState extends State<ResidentalDesign> {
  num _counter_bedroom = 0;
  num _counter_bathroom = 0;
  num _counter_kitchen = 0;
  num _counter_sides = 0;
  num _counter_livingroom = 0;
  num _counter_out = 0;
  void _increment_livingroom() {
    setState(() {
      _counter_livingroom++;
    });
  }

  void _dicrement_livingroom() {
    setState(() {
      _counter_livingroom--;
    });
  }

  void _increment_bedroom() {
    setState(() {
      _counter_bedroom++;
    });
  }

  void _dicrement_bedroom() {
    setState(() {
      _counter_bedroom--;
    });
  }

  void _increment_bathroom() {
    setState(() {
      _counter_bathroom++;
    });
  }

  void _dicrement_bathroom() {
    setState(() {
      _counter_bathroom--;
    });
  }

  void _increment_kitchen() {
    setState(() {
      _counter_kitchen++;
    });
  }

  void _dicrement_kitchen() {
    setState(() {
      _counter_kitchen--;
    });
  }

  void _increment_sides() {
    setState(() {
      _counter_sides++;
    });
  }

  void _dicrement_sides() {
    setState(() {
      _counter_sides--;
    });
  }

  void _increment_out() {
    setState(() {
      _counter_out++;
    });
  }

  void _dicrement_out() {
    setState(() {
      _counter_out--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              alignment: Alignment.center,
              child: Builder(
                builder: (context) => Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 20.0, right: 10.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
              Text(
                "سكني",
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
        endDrawer: Container(
          width: size.width * .9,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 55,
                ),
                ListTile(
                  title: Text(
                    'الصفحة الرئيسية',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomeBar()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'طلبات الاستشارات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'تتبع حالة الطلب',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomeBar()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'تواصل معنا',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ContactUs()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'الدعم الفني',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    //TechSupport

                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TechSupport()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'الاخبار والمدونات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Blogs()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'الاشعارات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Notify()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'عن التطبيق',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AboutApp()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'مشارعنا ',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OurProjects()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'البروفايل',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Profile()));
                  },
                ),
                Divider(
                  height: 3,
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'تسجيل الدخول',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'GE SS Two',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: sHeight * .05,
                      width: sWidth * .9,
                      child: Text(
                        "عروض تصاميم جاهزة للبيع (معماري - انشائي)",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: sHeight * .05,
                      width: sWidth * .9,
                      child: Text(
                        "معماري   ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: sWidth * .95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text(
                            "م2",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .15,
                              child: Center(child: TextField())),
                          Container(
                              width: sWidth * .21,
                              child: Text(
                                "الي",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                          Container(
                              child: Text(
                            "م2",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .15,
                              child: Center(child: TextField())),
                          Container(
                              width: sWidth * .21,
                              child: Text(
                                "المساحة المطلوبة من",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: sWidth * .23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              child: Text(
                            "م2",
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .15,
                              child: Center(child: TextField())),
                        ],
                      ),
                    ),
                    Container(
                        width: sWidth * .27,
                        child: Text(
                          "مساحة الارض",
                          style: TextStyle(
                            fontFamily: 'GE SS Two',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('بدون حمام'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.no_bathroom,
                                groupValue: _character_bath,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _character_bath = value;
                                    print(_character_bath);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('بحمام'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.bathroom,
                                groupValue: _character_bath,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _character_bath = value;
                                    print(_character_bath);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: sWidth * .25,
                        child: Text(
                          "غرفة النوم الرئيسية",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'GE SS Two',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: sWidth * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sWidth * .05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.keyboard_arrow_up_outlined),
                                    onPressed: () {
                                      _increment_bedroom();
                                      print(_counter_bedroom);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onPressed: () {
                                      _dicrement_bedroom();
                                      print(_counter_bedroom);
                                    },
                                  )
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .1,
                              height: sWidth * .1,
                              child: Center(child: Text("$_counter_bedroom"))),
                          Container(
                              width: sWidth * .2,
                              child: Text(
                                "عدد غرف النوم ",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: sWidth * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sWidth * .05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.keyboard_arrow_up_outlined),
                                    onPressed: () {
                                      _increment_bathroom();
                                      print(_counter_bathroom);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onPressed: () {
                                      _dicrement_bathroom();
                                      print(_counter_bathroom);
                                    },
                                  )
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .1,
                              height: sWidth * .1,
                              child: Center(child: Text("$_counter_bathroom"))),
                          Container(
                              width: sWidth * .2,
                              child: Text(
                                "عدد الحمامات ",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: sWidth * .32,
                                    child: ListTile(
                                      title: const Text('مغلق'),
                                      leading: Radio<SingingCharacterKitchen>(
                                        value: SingingCharacterKitchen.close,
                                        groupValue: _character_kitchen,
                                        onChanged:
                                            (SingingCharacterKitchen value) {
                                          setState(() {
                                            _character_kitchen = value;
                                            print(_character_kitchen);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: sWidth * .32,
                                    child: ListTile(
                                      title: const Text('مفتوح'),
                                      leading: Radio<SingingCharacterKitchen>(
                                        value: SingingCharacterKitchen.open,
                                        groupValue: _character_kitchen,
                                        onChanged:
                                            (SingingCharacterKitchen value) {
                                          setState(() {
                                            _character_kitchen = value;
                                            print(_character_kitchen);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sWidth * .05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.keyboard_arrow_up_outlined),
                                    onPressed: () {
                                      _increment_kitchen();
                                      print(_counter_kitchen);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onPressed: () {
                                      _dicrement_kitchen();
                                      print(_counter_kitchen);
                                    },
                                  )
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .1,
                              height: sWidth * .1,
                              child: Center(child: Text("$_counter_kitchen"))),
                          Container(
                              width: sWidth * .15,
                              child: Text(
                                "عدد المطابخ ",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: sWidth * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sWidth * .05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.keyboard_arrow_up_outlined),
                                    onPressed: () {
                                      _increment_livingroom();
                                      print(_counter_livingroom);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onPressed: () {
                                      _dicrement_livingroom();
                                      print(_counter_livingroom);
                                    },
                                  )
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .1,
                              height: sWidth * .1,
                              child:
                                  Center(child: Text("$_counter_livingroom"))),
                          Container(
                              width: sWidth * .2,
                              child: Text(
                                "عدد صالات الضيوف ",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('لا'),
                              leading: Radio<SingingCharacter3>(
                                value: SingingCharacter3.no,
                                groupValue: _character_living,
                                onChanged: (SingingCharacter3 value) {
                                  setState(() {
                                    _character_living = value;
                                    print(_character_living);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('نعم'),
                              leading: Radio<SingingCharacter3>(
                                value: SingingCharacter3.yes,
                                groupValue: _character_living,
                                onChanged: (SingingCharacter3 value) {
                                  setState(() {
                                    _character_living = value;
                                    print(_character_living);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .25,
                          child: Text(
                            "فصل الجزء الخاص بالزوار عن المنزل",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .35,
                            child: ListTile(
                              title: const Text('كلاسيكي'),
                              leading: Radio<SingingCharacter4>(
                                value: SingingCharacter4.classic,
                                groupValue: _character_design,
                                onChanged: (SingingCharacter4 value) {
                                  setState(() {
                                    _character_design = value;
                                    print(_character_design);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('مودرن'),
                              leading: Radio<SingingCharacter4>(
                                value: SingingCharacter4.modern,
                                groupValue: _character_design,
                                onChanged: (SingingCharacter4 value) {
                                  setState(() {
                                    _character_design = value;
                                    print(_character_design);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .23,
                          child: Text(
                            "نوع التصميم",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('لا'),
                              leading: Radio<SingingCharacterneighbor>(
                                value: SingingCharacterneighbor.no,
                                groupValue: _character_neighbor,
                                onChanged: (SingingCharacterneighbor value) {
                                  setState(() {
                                    _character_neighbor = value;
                                    print(_character_neighbor);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('نعم'),
                              leading: Radio<SingingCharacterneighbor>(
                                value: SingingCharacterneighbor.yes,
                                groupValue: _character_neighbor,
                                onChanged: (SingingCharacterneighbor value) {
                                  setState(() {
                                    _character_neighbor = value;
                                    print(_character_neighbor);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .25,
                          child: Text(
                            "هل يوجد جار ملاصق",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: sWidth * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sWidth * .05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.keyboard_arrow_up_outlined),
                                    onPressed: () {
                                      _increment_sides();
                                      print(_counter_sides);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onPressed: () {
                                      _dicrement_sides();
                                      print(_counter_sides);
                                    },
                                  )
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .1,
                              height: sWidth * .1,
                              child: Center(child: Text("$_counter_sides"))),
                          Container(
                              width: sWidth * .2,
                              child: Text(
                                "من كم جهه ملاصقة ",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('لا'),
                              leading: Radio<SingingCharacterpool>(
                                value: SingingCharacterpool.no,
                                groupValue: _character_pool,
                                onChanged: (SingingCharacterpool value) {
                                  setState(() {
                                    _character_pool = value;
                                    print(_character_pool);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('نعم'),
                              leading: Radio<SingingCharacterpool>(
                                value: SingingCharacterpool.yes,
                                groupValue: _character_pool,
                                onChanged: (SingingCharacterpool value) {
                                  setState(() {
                                    _character_pool = value;
                                    print(_character_pool);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .25,
                          child: Text(
                            "حوض سباحة",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('خارجي'),
                              leading: Radio<SingingCharacterPoolSide>(
                                value: SingingCharacterPoolSide.outside,
                                groupValue: _character_PoolSide,
                                onChanged: (SingingCharacterPoolSide value) {
                                  setState(() {
                                    _character_PoolSide = value;
                                    print(_character_PoolSide);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('داخلي'),
                              leading: Radio<SingingCharacterPoolSide>(
                                value: SingingCharacterPoolSide.inside,
                                groupValue: _character_PoolSide,
                                onChanged: (SingingCharacterPoolSide value) {
                                  setState(() {
                                    _character_PoolSide = value;
                                    print(_character_PoolSide);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: sWidth * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sWidth * .05,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.keyboard_arrow_up_outlined),
                                    onPressed: () {
                                      _increment_out();
                                      print(_counter_out);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onPressed: () {
                                      _dicrement_out();
                                      print(_counter_out);
                                    },
                                  )
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .1,
                              height: sWidth * .1,
                              child: Center(child: Text("$_counter_out"))),
                          Container(
                              width: sWidth * .2,
                              child: Text(
                                "المناور",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('لا'),
                              leading: Radio<SingingCharacterGarden>(
                                value: SingingCharacterGarden.no,
                                groupValue: _character_Garden,
                                onChanged: (SingingCharacterGarden value) {
                                  setState(() {
                                    _character_Garden = value;
                                    print(_character_Garden);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('نعم'),
                              leading: Radio<SingingCharacterGarden>(
                                value: SingingCharacterGarden.yes,
                                groupValue: _character_Garden,
                                onChanged: (SingingCharacterGarden value) {
                                  setState(() {
                                    _character_Garden = value;
                                    print(_character_Garden);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .25,
                          child: Text(
                            "مساحات  خضراء داخلية",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: sWidth * .6,
                    child: Text(
                      "في اي اتجاه تريد تصفير المبني ",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              //width: sWidth * .33,
                              child: ListTile(
                                title: const Text('غرب'),
                                leading: Radio<SingingCharacterDirection>(
                                  value: SingingCharacterDirection.West,
                                  groupValue: _character_Direction,
                                  onChanged: (SingingCharacterDirection value) {
                                    setState(() {
                                      _character_Direction = value;
                                      print(_character_Direction);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: sWidth * .33,
                              child: ListTile(
                                title: const Text('شرق'),
                                leading: Radio<SingingCharacterDirection>(
                                  value: SingingCharacterDirection.east,
                                  groupValue: _character_Direction,
                                  onChanged: (SingingCharacterDirection value) {
                                    setState(() {
                                      _character_Direction = value;
                                      print(_character_Direction);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // width: sWidth * .33,
                              child: ListTile(
                                title: const Text('جنوب'),
                                leading: Radio<SingingCharacterDirection>(
                                  value: SingingCharacterDirection.South,
                                  groupValue: _character_Direction,
                                  onChanged: (SingingCharacterDirection value) {
                                    setState(() {
                                      _character_Direction = value;
                                      print(_character_Direction);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //  width: sWidth * .33,
                              child: ListTile(
                                title: const Text('شمال'),
                                leading: Radio<SingingCharacterDirection>(
                                  value: SingingCharacterDirection.north,
                                  groupValue: _character_Direction,
                                  onChanged: (SingingCharacterDirection value) {
                                    setState(() {
                                      _character_Direction = value;
                                      print(_character_Direction);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: sWidth * .9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              width: sWidth * .2,
                              child: Center(child: TextField())),
                          Container(
                              width: sWidth * .5,
                              child: Text(
                                "درجة التشطيب من نجمة الي خمسة",
                                style: TextStyle(
                                  fontFamily: 'GE SS Two',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///////////////////////////////
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: sHeight * .05,
                      width: sWidth * .9,
                      child: Text(
                        "انشائي   ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'GE SS Two',
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //system
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: sWidth * .6,
                    child: Text(
                      "نوع النظام",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              //width: sWidth * .33,
                              child: ListTile(
                                title: const Text('بلاطة فطرية'),
                                leading: Radio<SingingCharacterSystem>(
                                  value: SingingCharacterSystem.fungal_slab,
                                  groupValue: _character_System,
                                  onChanged: (SingingCharacterSystem value) {
                                    setState(() {
                                      _character_System = value;
                                      print(_character_System);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: sWidth * .33,
                              child: ListTile(
                                title: const Text('هورودي'),
                                leading: Radio<SingingCharacterSystem>(
                                  value: SingingCharacterSystem.hurudi,
                                  groupValue: _character_System,
                                  onChanged: (SingingCharacterSystem value) {
                                    setState(() {
                                      _character_System = value;
                                      print(_character_System);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // width: sWidth * .33,
                              child: ListTile(
                                title: const Text('بلاطة صلبة سوليتي'),
                                leading: Radio<SingingCharacterSystem>(
                                  value: SingingCharacterSystem.Solid_slab,
                                  groupValue: _character_System,
                                  onChanged: (SingingCharacterSystem value) {
                                    setState(() {
                                      _character_System = value;
                                      print(_character_System);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //  width: sWidth * .33,
                              child: ListTile(
                                title: const Text('فلات سلاب للمساحات الكبيرة'),
                                leading: Radio<SingingCharacterSystem>(
                                  value: SingingCharacterSystem
                                      .Flat_slabs_for_large_spaces,
                                  groupValue: _character_System,
                                  onChanged: (SingingCharacterSystem value) {
                                    setState(() {
                                      _character_System = value;
                                      print(_character_System);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //hurudi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: sWidth * .6,
                    child: Text(
                      "نوع الهورودي",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // width: sWidth * .33,
                              child: ListTile(
                                title: const Text('خفاف'),
                                leading: Radio<SingingCharacterHurudi>(
                                  value: SingingCharacterHurudi.pumice,
                                  groupValue: _character_hurudi,
                                  onChanged: (SingingCharacterHurudi value) {
                                    setState(() {
                                      _character_hurudi = value;
                                      print(_character_hurudi);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //  width: sWidth * .33,
                              child: ListTile(
                                title: const Text('بومشي',
                                    style: TextStyle(fontSize: 14)),
                                leading: Radio<SingingCharacterHurudi>(
                                  value: SingingCharacterHurudi.Bumchi,
                                  groupValue: _character_hurudi,
                                  onChanged: (SingingCharacterHurudi value) {
                                    setState(() {
                                      _character_hurudi = value;
                                      print(_character_hurudi);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //  width: sWidth * .33,
                              child: ListTile(
                                title: const Text(
                                  'باجور',
                                  style: TextStyle(fontSize: 15),
                                ),
                                leading: Radio<SingingCharacterHurudi>(
                                  value: SingingCharacterHurudi.Bajaur,
                                  groupValue: _character_hurudi,
                                  onChanged: (SingingCharacterHurudi value) {
                                    setState(() {
                                      _character_hurudi = value;
                                      print(_character_hurudi);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //wall
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: sWidth * .6,
                    child: Text(
                      "نوع الحوائط",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'GE SS Two',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              //width: sWidth * .33,
                              child: ListTile(
                                title: const Text('بومشي'),
                                leading: Radio<SingingCharacterWall>(
                                  value: SingingCharacterWall.Bumchi,
                                  groupValue: _character_wall,
                                  onChanged: (SingingCharacterWall value) {
                                    setState(() {
                                      _character_wall = value;
                                      print(_character_wall);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: sWidth * .33,
                              child: ListTile(
                                title: const Text('فواصل'),
                                leading: Radio<SingingCharacterWall>(
                                  value: SingingCharacterWall.Separators,
                                  groupValue: _character_wall,
                                  onChanged: (SingingCharacterWall value) {
                                    setState(() {
                                      _character_wall = value;
                                      print(_character_wall);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // width: sWidth * .33,
                              child: ListTile(
                                title: const Text('بلوك'),
                                leading: Radio<SingingCharacterWall>(
                                  value: SingingCharacterWall.Block,
                                  groupValue: _character_wall,
                                  onChanged: (SingingCharacterWall value) {
                                    setState(() {
                                      _character_wall = value;
                                      print(_character_wall);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //  width: sWidth * .33,
                              child: ListTile(
                                title: const Text('خرسانة'),
                                leading: Radio<SingingCharacterWall>(
                                  value: SingingCharacterWall.Concrete,
                                  groupValue: _character_wall,
                                  onChanged: (SingingCharacterWall value) {
                                    setState(() {
                                      _character_wall = value;
                                      print(_character_wall);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Arch
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('لا'),
                              leading: Radio<SingingCharacterArchDesign>(
                                value: SingingCharacterArchDesign.no,
                                groupValue: _character_ArchDesign,
                                onChanged: (SingingCharacterArchDesign value) {
                                  setState(() {
                                    _character_ArchDesign = value;
                                    print(_character_ArchDesign);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('نعم'),
                              leading: Radio<SingingCharacterArchDesign>(
                                value: SingingCharacterArchDesign.yes,
                                groupValue: _character_ArchDesign,
                                onChanged: (SingingCharacterArchDesign value) {
                                  setState(() {
                                    _character_ArchDesign = value;
                                    print(_character_ArchDesign);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .25,
                          child: Text(
                            "ارفاق الخريطة المعمارية",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              //Loc
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: sWidth * .3,
                            child: ListTile(
                              title: const Text('لا'),
                              leading: Radio<SingingCharacterLoc>(
                                value: SingingCharacterLoc.no,
                                groupValue: _character_Loc,
                                onChanged: (SingingCharacterLoc value) {
                                  setState(() {
                                    _character_Loc = value;
                                    print(_character_Loc);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth * .33,
                            child: ListTile(
                              title: const Text('نعم'),
                              leading: Radio<SingingCharacterLoc>(
                                value: SingingCharacterLoc.yes,
                                groupValue: _character_Loc,
                                onChanged: (SingingCharacterLoc value) {
                                  setState(() {
                                    _character_Loc = value;
                                    print(_character_Loc);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sWidth * .25,
                          child: Text(
                            "ارفاق كروكي الموقع",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'GE SS Two',
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              //btn
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                              'الغاء',
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
                              Navigator.pop(context);
                            }),
                      ),
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
                              'ارسال',
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SendDone()));
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
