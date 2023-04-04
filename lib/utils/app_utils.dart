import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AppUtils {
  final get = GetIt.instance;

  void initNetwork() {
    final dio = Dio();

    if (!get.isRegistered<Dio>()) {
      get.registerSingleton<Dio>(dio);
    }
  }
}
