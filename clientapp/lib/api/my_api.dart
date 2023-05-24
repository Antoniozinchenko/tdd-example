import 'package:clientapp/utils/string_parser.dart';
import 'package:dio/dio.dart';

class MyApi {
  final Dio dio;
  MyApi(this.dio);

  Future<List<String>> fetchData() async {
    final res = await dio.get('/');
    return parseStrings(res.data);
  }
}
