import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  SharedPreferencesController._();
  static SharedPreferencesController cache = SharedPreferencesController._();
  factory SharedPreferencesController() => cache;
  late SharedPreferences preferences;
  Future<void> initCache() async {
    preferences = await SharedPreferences.getInstance();
  }

  setData(String json, int catNum) async {
    bool jsonState = false, catNumState = false;
    await preferences
        .setString('json', json)
        .then((value) => jsonState = value);
    await preferences
        .setInt('catNum', catNum)
        .then((value) => catNumState = value);
    return jsonState && catNumState;
  }

  getCatNum() async {
    return preferences.getInt('catNum');
  }

  getJson() async {
    return preferences.getString('json');
  }
}
