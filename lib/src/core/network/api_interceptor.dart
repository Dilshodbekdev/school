import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/router/route_config.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
    String lang = await Prefs.getString(AppConstants.kLanguage) ?? "uz";
    if (token.isNotEmpty) {
      options.headers["Authorization"] = 'Bearer $token';
      options.headers["Accept-Language"] = lang;
    }
    LogService.request(options);
    super.onRequest(options, handler);
  }

  Future<bool> _refreshToken() async {
    String token = await Prefs.getString(AppConstants.kRefreshToken) ?? "";
    String server = await Prefs.getString(AppConstants.kServer) ?? "";
    try {
      final response = await Dio().post("${server}api/token/refresh", data: {
        'refresh': token,
      });
      if (response.statusCode == 200) {
        Prefs.setString(AppConstants.kAccessToken, response.data['access']);
        Prefs.setString(AppConstants.kRefreshToken, response.data['refresh']);
        debugPrint('Refresh token: ${response.data}');
        return true;
      }else{
        rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
      }
    } catch (e) {
      // Handle refresh token failure (e.g., log out the user)
      debugPrint('Refresh token failed: $e');
      rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
    }
    return false;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.response(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
     // rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
      final isRefreshed= await _refreshToken();
      String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
      if(isRefreshed==true){
        final retryRequest = err.requestOptions;
        retryRequest.headers['Authorization'] =
        'Bearer $token';
      }
    }
    LogService.errorResponse(err);
    super.onError(err, handler);
  }
}
