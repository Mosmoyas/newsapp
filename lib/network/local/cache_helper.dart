import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  //intiate an object of SharedPreferences
  static SharedPreferences? sharedPreferences;
  //To create init function to be load in the main screen by reloading the App
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

//Set value Key Value to the method putData which will be running by changing in Cubit class
  static Future<bool?> putData(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

//get Value which will be add to the event button
  static bool? getData({required String key}) {
    return sharedPreferences?.getBool(key);
  }
}
