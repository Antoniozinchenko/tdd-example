import 'package:clientapp/api/my_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceLocatior {
  static void registerSingletons() {
    final httpClient = Dio(
      BaseOptions(baseUrl: 'http://localhost:8080'),
    );
    GetIt.I.registerSingleton(httpClient);
    GetIt.I.registerSingleton(MyApi(httpClient));
  }
}
