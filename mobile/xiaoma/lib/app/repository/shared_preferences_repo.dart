import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaoma/app/app.dart';

Future<SharedPreferences> preferences = SharedPreferences.getInstance();

class SharedPreferencesRepo {
  SharedPreferencesRepo({
    required SharedPreferences prefs,
  }) : _prefs = prefs;
  final SharedPreferences _prefs;

  Future<bool> clearPreferences() async {
    final response = await _prefs.clear();
    return response;
  }

  // onboarded setters and getters
  Future<bool> setOnBoardedStatus({required bool value}) async {
    final response = await _prefs.setBool(AppConstants.userOnBoarded, value);
    return response;
  }

  bool getOnBoardedStatus() {
    if (!_prefs.containsKey(AppConstants.userOnBoarded)) {
      return false;
    }

    final response = _prefs.getBool(AppConstants.userOnBoarded);
    return response as bool;
  }

  // is authenticated setters and getters
  Future<bool> setIsAuthenticated({required bool value}) async {
    final response = await _prefs.setBool(AppConstants.isAuthenticated, value);
    return response;
  }

  bool getIsAuthenticated() {
    if (!_prefs.containsKey(AppConstants.isAuthenticated)) {
      return false;
    }
    final response = _prefs.getBool(AppConstants.isAuthenticated) as bool;
    return response;
  }
}
