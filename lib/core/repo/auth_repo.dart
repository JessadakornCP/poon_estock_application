import '../connection/rest_service.dart';
import '../init/constants/app/api_endpoints.dart';
import '../model/response/user_Profile/user_profile_res_model.dart';

class AuthRepo {
  Future<UserProfileRes?> postLogin({required Map bodyData}) async {
    try {
      final response = await RestService.postWithAuthAPI(
        urlPath: ApiEndpoint.login,
        bodyData: bodyData,
      );
      return userProfileResFromJson(response.response);
    } catch (e) {
      rethrow;
    }
  }
}
