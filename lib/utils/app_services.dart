import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app/services/login_service.dart';

class AppServices {
  final Dio dio;

  AppServices(this.dio);

  final get = GetIt.I;

  registerLoginClient(String url) async {
    dio.interceptors.clear();

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    if (!get.isRegistered<Dio>()) {
      get.registerSingleton<Dio>(dio);
    }

    if (!get.isRegistered<LoginService>()) {
      get.registerFactory(() => LoginService(dio, baseUrl: url));
    } else {
      get.unregister<LoginService>();

      get.registerFactory(
        () => LoginService(dio, baseUrl: url),
      );
    }
  }
}
