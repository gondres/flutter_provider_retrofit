import 'package:login_app/model/login_body.dart';
import 'package:login_app/model/repositories_response.dart';
import 'package:login_app/services/login_service.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  Future<RepositoriesResponse> login(LoginBody loginBody) async {
    late RepositoriesResponse response;
    Dio dio = Dio();
    LoginService _loginService = LoginService(dio);
    final loginResponse = await _loginService.login(loginBody).then((value) {
      response = RepositoriesResponse(isSuccess: true, dataResponse: value);
    }).onError((error, stackTrace) {
      if (error is DioError) {
        final err = error.message;

        response = RepositoriesResponse(isSuccess: false, dataResponse: err);
      } else {
        response = RepositoriesResponse(
            isSuccess: false, dataResponse: error.toString());
      }
    });

    return response;
  }
}
