import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Preferences {
  static late StreamingSharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await StreamingSharedPreferences.instance;
  }

  static Preference<bool> get showPercentPos {
    return _prefs.getBool("showPercentPos", defaultValue: true);
  }

  static Preference<bool> get showRemainingTime {
    return _prefs.getBool("showRemainingTime", defaultValue: true);
  }
}
