import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class PreferencesMethods {
  Future<String?> getUserDetails(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);//??"";
  }
}