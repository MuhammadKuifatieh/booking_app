import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<void> removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(PrefKeys.token);
  }

  static Future<int> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final user = pref.getInt(PrefKeys.user)!;
    return user;
  }

  static Future<void> setUserId(int userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(PrefKeys.user, userId);
  }

  static Future<void> removeUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(PrefKeys.user);
  }

  static Future<bool> isFirstOpen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return !pref.containsKey(PrefKeys.isShowOnBorder);
  }

  static Future<void> setShowOnBoarder() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(PrefKeys.isShowOnBorder, true);
  }

  static Future<void> logout() async {
    await removeToken();
    await removeUserId();
  }
}
