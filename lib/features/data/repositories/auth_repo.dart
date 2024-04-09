import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../common/constants/app_constants.dart';
import '../api/api_client.dart';
import '../models/request/token_request.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(
      {required String username, required String password}) async {
    return await apiClient.postLogin(
        AppConstants.LOGIN_URI,
        TokenRequest(
            password: password,
            username: username,
            clientId: "core_client",
            clientSecret: "secret",
            grantType: "password").toJson()
    );
  }

  Future<void> saveTokenUser(String token) async {
    await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> clearUserToken() async {
    await sharedPreferences.remove(AppConstants.TOKEN);
  }
}