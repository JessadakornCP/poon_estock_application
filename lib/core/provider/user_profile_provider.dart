import 'package:flutter/foundation.dart';
import '../init/shared_preferences/shared_preferences.dart';
import '../model/response/user_Profile/user_profile_model.dart';
import '../utility/formatters.dart';

class UserProfileProvider extends ChangeNotifier {
  final Singleton _singleton = Singleton();

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;
  set userProfile(UserProfile? value) {
    _userProfile = value;
    notifyListeners();
  }

  Future<bool> checkValidateUserPass() async {
    try {
      String? token = await _singleton.getTokenApi();
      String? userId = await _singleton.getUserId();

      if (emptyToNull(token) != null && userId != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserProfile() async {
    try {
      await _singleton.clearAll();
      userProfile = null;
      // await AppFirebase.deleteToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkValidateUserLocal() async {
    try {
      String? userId = await _singleton.getUserId();
      String? token = await _singleton.getTokenApi();
      if (userId != null && emptyToNull(token) != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
