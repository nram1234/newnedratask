import 'package:dio/dio.dart';

import '../uit/all_string_const.dart';
import '../uit/storage.dart';


class DioSingleton {
  Dio dio = Dio(BaseOptions(
      headers: {
        'apikey': "",
        'Content-Type': 'application/json',
  //'Authorization': 'Bearer ${SecureStorage.readSecureData(AllStringConst.Token)}',

        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYzMzJkZjA4NTk1NGUzYjM3YTI2MWViNyJ9LCJpYXQiOjE2NjQyNzgyODAsImV4cCI6MTY2Njg3MDI4MH0.utLqzyB6By1X6TZvwbbqZLBfr4lkshWXpmgn_xmo0Co',
      }
      ));
  static final DioSingleton _singleton = DioSingleton._internal();

  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal();
}
