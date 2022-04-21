import 'package:flutter_page/config/contacts.dart';
import 'package:flutter_page/entity/session_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entity/user_entity.dart';



class SPUtil{

  static UserEntity? user;

  static init() async{
    final userJson = await getJsonValue(SP.CUR_USER);
    if (userJson != null) {
      user = UserEntity.fromJson(userJson);
    }
  }

  static storeString(String k,v) async {
    final key = getKey(k);
    if (key == null) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, v);
  }

  static Future<String?> getStringValue(String k) async {
    final key = getKey(k);
    if (key == null) {
      return null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<Map<String, dynamic>?> getJsonValue(String k) async {
    final key = getKey(k);
    if (key == null) {
      return null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) as Map<String, dynamic>;
  }

  static String? getKey(String key){
    if (key.startsWith("U_")) {
      final id = user?.id;
      if (id != null) {
        return key.replaceFirst("U_", "${id}_");
      } else {
        return null;
      }
    }
    return key;
  }
}