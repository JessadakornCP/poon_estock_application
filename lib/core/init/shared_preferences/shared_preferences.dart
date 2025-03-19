import 'package:shared_preferences/shared_preferences.dart';

class Singleton {
  static final Singleton shared = Singleton._internal();

  factory Singleton() {
    return shared;
  }

  Singleton._internal();

  Future setTokenApi(String tokenApi) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('TokenApi', tokenApi);
  }

  Future<String?> getTokenApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('TokenApi') ?? '';
  }

  Future setFcmToken(String fcmToken) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fcmToken', fcmToken);
  }

  Future<String?> getFcmToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('fcmToken');
  }

  Future setApnsToken(String apnsToken) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('apnsToken', apnsToken);
  }

  Future<String?> getApnsToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('apnsToken');
  }

  Future setUserId(String userId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id', userId);
  }

  Future<String?> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('id');
  }

  Future setExpiresAt(String expiresAt) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('expiresAt', expiresAt);
  }

  Future<String?> getExpiresAt() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('expiresAt') ?? '';
  }

  Future setPasswordChangedAt(String passwordChangedAt) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('passwordChangedAt', passwordChangedAt);
  }

  Future<String?> getPasswordChangedAt() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('passwordChangedAt') ?? '';
  }

  Future setFullName(String fullName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fullName', fullName);
  }

  Future<String?> getFullName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('fullName') ?? '';
  }

  Future clearAll() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
