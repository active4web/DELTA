import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:delta/DataModel/projectsM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:delta/Screen/Home/projectDetails.dart';
import 'package:delta/draw.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Designs extends StatefulWidget {

  @override
  _DesignsState createState() => _DesignsState();
}

class _DesignsState extends State<Designs> {
  String? token;

  Future<Null> gettoken() async {
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
    super.initState();
  }

  Repository _repo = Repository();

  @override
  Widget build(BuildContext context) {
    List<Widget> itemSliders = [];

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
              "مشاريعنا",
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
      body: Container(
          padding: EdgeInsets.all(12.0),
          child: StreamBuilder<ProjectsM>(
              stream: _repo
                  .getProjects(
                      key: "1234567890",
                      token_id: token??"",
                      limit: '20',
                      page_number: '0')
                  .asStream(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.builder(
                      itemCount: snapshot.data?.result?.allProjects?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          mainAxisExtent: 320),
                      itemBuilder: (BuildContext context, int index) {
                       int? sliderLength = snapshot.data?.result?.allProjects?[index].allSlider?.length??0;
                        for (int i = 0; i < sliderLength; i++) {
                          itemSliders.add(Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.teal),
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        snapshot.data?.result?.allProjects?[index].allSlider?[i].img??"",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ))));
                        }
                        return Card(
                            elevation: 0,
                            child: Container(
                                child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.topCenter,
                                        width: size.width * .42,
                                        height: size.height * .18,
                                        child: null ??
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CarouselSlider(
                                                items: snapshot
                                                    .data
                                                    ?.result
                                                    ?.allProjects?[index]
                                                    .allSlider
                                                    ?.map((e) => Image.network(
                                                          e.img ?? "",
                                                          fit: BoxFit.cover,
                                                        ))
                                                    .toList(),
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  viewportFraction: .95,
                                                  aspectRatio: 2,
                                                  height: size.height * .35,
                                                  enlargeCenterPage: true,
                                                ),
                                              ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                //   Image.network(snapshot.data.result.allProjects[index].articlesImage),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    child: Text(
                                      snapshot.data?.result?.allProjects?[index]
                                              .projectName ??
                                          "",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xfff3a005),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'معلومات عن الموقع',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: 'GE SS Two',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                      child: Text(
                                        'اقرأ المزيد',
                                        style: TextStyle(
                                          fontFamily: 'GE SS Two',
                                          fontSize: 17,
                                          color: const Color(0xffefefef),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.orangeAccent,
                                        backgroundColor: Color(0xfff3a005),
                                        elevation: 20,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ProjectDetails(
                                                    project: snapshot.data?.result?.allProjects?[index]),),);
                                      }),
                                ),
                              ],
                            )));
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
