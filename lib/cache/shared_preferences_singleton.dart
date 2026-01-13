import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static void setName(String key, String value) {
    _instance.setString(key, value);
  }

  static String getName(String key) {
    return _instance.getString(key) ?? '';
  }
}
