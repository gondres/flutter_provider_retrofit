import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_app/model/token_response.dart';
import 'package:login_app/utils/http_status_code.dart';
import 'package:retrofit/retrofit.dart';

import '../model/login_body.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST("login")
  @HttpStatusCode([HttpStatus.ok, HttpStatus.unauthorized])
  Future<TokenResponse> login(@Body() LoginBody loginBody);
}
