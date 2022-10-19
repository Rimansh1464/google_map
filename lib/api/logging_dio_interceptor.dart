import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getX;

import '../controller/user_controller.dart';
import '../main.dart';
import '../model/user_data.dart';

class LoggingDioInterceptor implements Interceptor {
  final UserController _userController = getX.Get.find();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("message ==> response  $err ${err.response?.statusCode}    ${err.response?.data}");
    if (err.response?.statusCode == 401) {
      _userController.userData.value = UsearDataModel();
      _userController.userData.refresh();
      log('', error: '401');
      // getX.Get.offAll(() => SignInUpScreen());
    }
    handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    log("message ==> response  $response ${response.statusCode}    ${response.data}");
    if (response.statusCode == 200 && response.data is Map) {
      if (response.data["message"] == "Token Time Expire.") {
        _userController.userData.value = UsearDataModel();
        _userController.userData.refresh();
        log('', error: '401');
        getX.Get.offAll(() => const mainPage());
        // _userController.showError(msg: )
      }

      // getX.Get.offAll(() => SignInUpScreen());
    }
    handler.next(response);
  }
}
