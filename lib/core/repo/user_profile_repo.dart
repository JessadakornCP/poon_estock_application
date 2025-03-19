import '../connection/rest_service.dart';
import '../init/constants/app/api_endpoints.dart';
import '../model/response/user_Profile/user_profile_res_model.dart';

class UserProfileRepo {
  Future<UserProfileRes?> getOne({
    required int? userId,
  }) async {
    try {
      final response = await RestService.getWithAuthAPI(
        urlPath: "${ApiEndpoint.userProfile}/$userId",
      );
      return userProfileResFromJson(response.response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileRes?> putOne({
    required int? id,
    required Map bodyData,
  }) async {
    try {
      final response = await RestService.putWithAuthAPI(
        urlPath: "${ApiEndpoint.userProfile}/$id",
        bodyData: bodyData,
      );
      return userProfileResFromJson(response.response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileRes?> putUserProfileInformation({
    required int? id,
    required int? userId,
    required Map bodyData,
  }) async {
    try {
      final response = await RestService.putWithAuthAPI(
        urlPath: "${ApiEndpoint.userProfileInformations}/$userId/$id",
        bodyData: bodyData,
      );
      return userProfileResFromJson(response.response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileRes?> putUpdatePassword({
    required int? id,
    required Map bodyData,
  }) async {
    try {
      final response = await RestService.putWithAuthAPI(
        urlPath: "${ApiEndpoint.updatePassword}/$id",
        bodyData: bodyData,
      );
      return userProfileResFromJson(response.response);
    } catch (e) {
      rethrow;
    }
  }
}
