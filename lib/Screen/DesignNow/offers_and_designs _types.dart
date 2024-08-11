import 'package:delta/DataModel/FormsModels/design_nowM.dart';
import 'package:delta/DataModel/offers_and_dsigns_model.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/DesignNow/special_design_now_offers.dart';
import 'package:delta/Screen/other_services.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../draw.dart';
import 'residental_types.dart';
import 'architectural_residential_design.dart';

class OffersAndDesigns extends StatefulWidget {

  String? jwt;
  String? cat_id;
  @override
  _OffersAndDesignsState createState() => _OffersAndDesignsState();

  OffersAndDesigns({this.jwt, this.cat_id});
}

class _OffersAndDesignsState extends State<OffersAndDesigns> {
  String? token;
  Future<String?> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  @override
  void initState() {
    gettoken();
    _repo.getOffersAndDesigns(
        key: "1234567890", token: token!, catId: widget.cat_id!);
    super.initState();
  }

  Repository _repo = Repository();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
        child: StreamBuilder<OffersAndDesignsModel>(
      stream: _repo
          .getOffersAndDesigns(
              key: "1234567890", token: token.toString(), catId: widget.cat_id!)
          .asStream(),
      builder: (context, snapshot) {
        return snapshot.data != null
            ? Scaffold(
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
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
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
                        snapshot.data?.result?.categoryDate?.title??"",
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
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height * .06,
                          width: size.width * .8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: size.height * 1, width: size.width * 1),
                            child: ElevatedButton(
                                child: Text(
                                  snapshot.data?.result?.lableList?[0].title??"",
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 17,
                                    color: const Color(0xFFFAF4F4),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 20,
                                  backgroundColor: Color(0xff3b6745),
                                  foregroundColor: Colors.orangeAccent,

                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ResidentialTypes(
                                                cat_id: snapshot.data?.result?.lableList?[0].lebalId.toString(),
                                                jwt: token,
                                              )));
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height * .06,
                          width: size.width * .8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: size.height * 1, width: size.width * 1),
                            child: ElevatedButton(
                                child: Text(
                                  snapshot.data?.result?.lableList?[1].title??"",
                                  style: TextStyle(
                                    fontFamily: 'GE SS Two',
                                    fontSize: 17,
                                    color: const Color(0xFFFAF4F4),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 20,

                                  backgroundColor: Color(0xff3b6745), // Button background color
                                  foregroundColor: Colors.orangeAccent, // Button text color
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              SpecialDesignNowOffers(
                                                cat_id: snapshot.data?.result?.lableList?[1].lebalId.toString(),
                                                jwt: token,
                                              )));
                                }),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(15.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Container(
                      //         height: sHeight * .05,
                      //         width: sWidth * .9,
                      //         child: Text(
                      //           "${snapshot.data?.result?.categoryDate.details}",
                      //           textDirection: TextDirection.rtl,
                      //           style: TextStyle(
                      //             fontFamily: 'GE SS Two',
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ))
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    ));
  }
}
