



import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getUserData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int id = preferences.getInt("id");
  String jwt = preferences.getString("token");
  String name = preferences.getString("name");
  return [id.toString(),jwt,name];
}