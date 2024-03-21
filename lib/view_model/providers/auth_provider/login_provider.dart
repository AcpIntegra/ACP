import 'dart:convert';
import 'package:acp_app/data/models/annals_and_aimcc/login_model.dart';
import 'package:acp_app/data/models/annals_and_aimcc/login_response_model.dart';
import 'package:acp_app/data/network/service/connectivity.dart';
import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/main/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends Notifier<LoginResponse> {
  final Login login = Login.emptyWithClient();
  final SharedPreferences prefs = Config().prefs;

  @override
  LoginResponse build() => LoginResponse.empty();

  Future<void> getUserToken(LoginResponse responseData) async {
    try {
      state = responseData;
    } catch (e) {
      pushErrorLog('getUserToken', jsonEncode(e));
    }
  }

  Future<List<dynamic>> verifyCredentials(
      String username, String password) async {
    try {
      if (ConnectivityStatus().isConnected == true) {
        var headers = {'Content-Type': 'application/json'};
        login.username = username;
        login.password = password;
        var loginData = json.encode(login.toMap());
        try {
          var dio = Dio();
          Response<String> response = await dio.request(
            'https://webapi.acponline.org/token?scope=Authentication+Membership+Status+openid',
            options: Options(
              method: 'POST',
              headers: headers,
              validateStatus: (status) =>
                  status != null && status >= 200 && status < 500,
            ),
            data: loginData,
          );
          if (response.statusCode == 401) {
            // Return success status and status code
            state = LoginResponse.fromJson(json.decode(response.data!));
            return [false, response.data];
          } else if (response.statusCode == 200) {
            state = LoginResponse.fromJson(json.decode(response.data!));

            String tokenToString = response.data!;

            await prefs.setString("userToken", tokenToString);

            return [true, response.data];
          } else {
            // Handle other status codes
            return [false, response.statusCode];
          }
        } catch (e) {
          // Handle any exceptions (e.g., network errors)
          return [false, 0]; // Return 0 for unknown error
        }
      } else {
        return [false, -1];
      }
    } catch (e) {
      pushErrorLog('verifyCredentials', jsonEncode(e));
      return [];
    }
  }

  Future<void> getSignedOut() async {
    // Remove data for the 'tokendetails' key.
    try {
      await prefs.remove('userToken');
      state = LoginResponse.empty();
    } catch (e) {
      pushErrorLog('getSignedOut', jsonEncode(e));
    }
  }
}

final NotifierProvider<LoginNotifier, LoginResponse> loginProvider =
    NotifierProvider<LoginNotifier, LoginResponse>(() => LoginNotifier());
