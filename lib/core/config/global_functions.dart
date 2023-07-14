import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/auth_response.dart';
import '../constant/perf_keys.dart';

class GlobalFunctions {
  GlobalFunctions._();
  static Future<bool> isAuth() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey(PrefKeys.token);
  }

  static Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString(PrefKeys.token);
    return token;
  }

  static Future<void> setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.token, token);
  }

  static Future<void> removeToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(PrefKeys.token);
  }

  static Future<UserModel> getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final user =
        UserModel.fromJson(json.decode(pref.getString(PrefKeys.user)!));
    return user;
  }

  static Future<void> setUserInfo(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.user, user.toJson().toString());
  }

  static Future<void> removeUserInfo(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(PrefKeys.user);
  }
}
