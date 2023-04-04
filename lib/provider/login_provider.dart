import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app/model/login_body.dart';
import 'package:login_app/utils/app_services.dart';
import 'package:login_app/utils/app_utils.dart';
import 'package:provider/provider.dart';
import 'package:login_app/base_resource/base_path.dart' as basePath;

import 'package:login_app/services/login_service.dart';

import '../model/token_response.dart';

class LoginProvider extends ChangeNotifier {
  LoginService _loginService;

  LoginProvider(this._loginService);

  Future<TokenResponse> login(String username, String password) async {
    final appUtils = AppUtils();

    appUtils.initNetwork();

    final AppServices appServices = AppServices(GetIt.I.get<Dio>());

    await appServices.registerLoginClient(basePath.baseUrl);

    final _services = GetIt.I.get<LoginService>();

    final request = LoginBody(username: username, password: password);

    late TokenResponse res;

    try {
      final response = await _services.login(request);

      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 401) {
          // handle unauthorized error
          res = TokenResponse(token: "");
          print('Unauthorized error: ${e.message.toString()}');
        } else {
          // handle other errors
          res = TokenResponse(token: "");
          print('Error: ${e.message}');
        }
      } else {
        // handle other exceptions
        res = TokenResponse(token: "");
        print('Exception: ${e.toString()}');
      }
    }
    return res;
  }
}
