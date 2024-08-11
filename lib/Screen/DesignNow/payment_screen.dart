import 'package:delta/DataModel/profile_infoM.dart';
import 'package:delta/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentScreen extends StatefulWidget {
  int? orderId;
  String? image;
  String? description;
  String? price;
  PaymentScreen({this.orderId, this.price, this.image, this.description});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

final nameController =
    TextEditingController(text: info?.result?.customerInfo?.name);
final phoneController =
    TextEditingController(text: info?.result?.customerInfo?.phone);
final addressController =
    TextEditingController(text: info?.result?.customerInfo?.address);
final emailController =
    TextEditingController(text: info?.result?.customerInfo?.email);
final messageController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
int paymentType = 1;
String? token;

Repository _repo = Repository();
ProfileInfoM? info;

class _PaymentScreenState extends State<PaymentScreen> {
  Future<String?> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    info = await _repo.proInfo(key: '1234567890', token_id: token!);
    setState(() {});
    return token;
  }

  @override
  void initState() {
    gettoken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "الدفع",
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
      body: info != null
          ? Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Container(
                      height: 80,
                      width: 100,
                      child: Image.network(widget.image??"")),
                  Text(
                    widget.description??"",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.price??"",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                            title: Text("كاش"),
                            activeColor: Color(0xff3b6745),
                            value: 1,
                            groupValue: paymentType,
                            onChanged: (int? value) {
                              setState(() {
                                paymentType = value!;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile(
                            title: Text("اونلاين"),
                            activeColor: Color(0xff3b6745),
                            value: 0,
                            groupValue: paymentType,
                            onChanged: (value) {
                              // setState(() {
                              //   paymentType = value;
                              // });
                            }),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                      width: sWidth * .95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "الاسم",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xffaa6414),
                                fontFamily: 'GE SS Two',
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: sWidth * .8,
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب ادخال الاسم";
                                  }
                                  return null;
                                },

                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                      width: sWidth * .95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "رقم الجوال",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xffaa6414),
                                fontFamily: 'GE SS Two',
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: sWidth * .8,
                              child: TextFormField(
                                controller: phoneController,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب ادخال رقم الجوال";
                                  }
                                  return null; // Return null if the field is valid
                                },
                                keyboardType: TextInputType.phone,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                      width: sWidth * .95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "العنوان",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xffaa6414),
                                fontFamily: 'GE SS Two',
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: sWidth * .8,
                              child: TextFormField(
                                controller: addressController,
                                keyboardType: TextInputType.streetAddress,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب ادخال العنوان";
                                  }
                                  return null; // Return null if the field is valid
                                },
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                      width: sWidth * .95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "البريد الالكتروني",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xffaa6414),
                                fontFamily: 'GE SS Two',
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: sWidth * .8,
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          )
                        ],
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
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            height: size.height * 1, width: size.width * 1),
                        child: ElevatedButton(
                            child: Text(
                              "ارسال",
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
                              foregroundColor: Colors.orangeAccent,
                              // primary: Color(0xff3b6745),
                              // onPrimary: Colors.orangeAccent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate())
                                dialog(sWidth, size);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future dialog(sWidth, size) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("سلة المناقشات"),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                      width: sWidth * .95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "الرسالة",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xffaa6414),
                                fontFamily: 'GE SS Two',
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: sWidth * .8,
                              child: TextField(
                                controller: messageController,
                                keyboardType: TextInputType.emailAddress,
                                textDirection: TextDirection.rtl,
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
                                    height: size.height * 1,
                                    width: size.width * 1),
                                child: ElevatedButton(
                                    child: Text(
                                      "ارسال",
                                      style: TextStyle(
                                        fontFamily: 'GE SS Two',
                                        fontSize: 17,
                                        color: const Color(0xFFFAF4F4),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 20,
                                      backgroundColor: Color(0xfff3a005), // Button background color
                                      foregroundColor: Colors.orangeAccent,
                                      // primary: Color(0xff3b6745),
                                      // onPrimary: Colors.orangeAccent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    onPressed: () async {
                                      await Repository()
                                          .sendPaymentDetails(
                                              token_id: token!,
                                              address: addressController.text,
                                              name: nameController.text,
                                              phone: phoneController.text,
                                              email: emailController.text,
                                              designId: widget.orderId!,
                                              message: messageController.text,
                                              paymentType: paymentType)
                                          .then((value) {
                                        print(value.data);
                                        var snackBar = SnackBar(
                                            content: Text(
                                                'تم تنفيذ طلب الشراء بنجاح وسوف يتم التواصل فى اقل وممكن'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        Navigator.pop(context);
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
