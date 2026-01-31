import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Define the keys for the local storage
  static const String token = 'token';
  static const String user = 'user';
  static const String theme = 'theme';
  static const String language = 'language';

  /// Define the methods for the local storage
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: token, value: token);
  }

  Future<String> getToken() async {
    return await _secureStorage.read(key: token) ?? '';
  }

  Future<void> saveTheme(String theme) async {
    await _sharedPreferences.setString(theme, theme);
  }

  String getTheme() {
    return _sharedPreferences.getString(theme) ?? '';
  }
}
