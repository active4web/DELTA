import 'package:delta/DataModel/gallery_model.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/DesignNow/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../draw.dart';

class ResidentialTypes extends StatefulWidget {
  ResidentialTypes({Key key, this.jwt, this.cat_id}) : super(key: key);
  String jwt;
  String cat_id;
  @override
  _ResidentialTypesState createState() => _ResidentialTypesState();
}

class _ResidentialTypesState extends State<ResidentialTypes> {
  String token;
  TransformationController transformationController =
      TransformationController();
  Future<String> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    return token;
  }

  @override
  void initState() {
    gettoken();
    super.initState();
  }

  Repository _repo = Repository();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Material(
      child: StreamBuilder<GalleryOfferModel>(
          stream: _repo
              .getAllDesigns(
                key: '1234567890',
                token_id: widget.jwt,
                limit: "20",
                pageNumber: "0",
              )
              .asStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
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
                        "المعرض",
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
                body: GridView.count(
                    padding: EdgeInsets.all(10),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.55,
                    mainAxisSpacing: 10,
                    children: List.generate(
                        snapshot.data.result.allDesigns.length,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot
                                    .data.result.allDesigns[index].name),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      useSafeArea: true,
                                      barrierColor: Colors.white,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            textDirection: TextDirection.rtl,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Material(
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            height: 200,
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                Image.network(
                                                              snapshot
                                                                  .data
                                                                  .result
                                                                  .allDesigns[
                                                                      index]
                                                                  .secondImage,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 200,
                                                      width: double.infinity,
                                                      child: Image.network(
                                                        snapshot
                                                            .data
                                                            .result
                                                            .allDesigns[index]
                                                            .secondImage,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "الاسم :" +
                                                      snapshot
                                                          .data
                                                          .result
                                                          .allDesigns[index]
                                                          .name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "الوصف :" +
                                                    snapshot
                                                        .data
                                                        .result
                                                        .allDesigns[index]
                                                        .description,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  "السعر :" +
                                                      snapshot
                                                          .data
                                                          .result
                                                          .allDesigns[index]
                                                          .price,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.network(
                                      snapshot.data.result.allDesigns[index]
                                          .designImg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data.result.allDesigns[index]
                                      .description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                                Text(snapshot
                                    .data.result.allDesigns[index].price),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                            orderId: snapshot.data.result
                                                .allDesigns[index].offerId,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    height: size.height * .06,
                                    width: size.width * .8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          height: size.height * 1,
                                          width: size.width * 1),
                                      child: ElevatedButton(
                                          child: Text(
                                            "شراء",
                                            style: TextStyle(
                                              fontFamily: 'GE SS Two',
                                              fontSize: 17,
                                              color: const Color(0xFFFAF4F4),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            primary: Color(0xff3b6745),
                                            onPrimary: Colors.orangeAccent,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentScreen(
                                                    orderId: snapshot
                                                        .data
                                                        .result
                                                        .allDesigns[index]
                                                        .offerId,
                                                    image: snapshot
                                                        .data
                                                        .result
                                                        .allDesigns[index]
                                                        .designImg,
                                                    description: snapshot
                                                        .data
                                                        .result
                                                        .allDesigns[index]
                                                        .description,
                                                    price: snapshot
                                                        .data
                                                        .result
                                                        .allDesigns[index]
                                                        .price,
                                                  ),
                                                ));
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            ))),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
