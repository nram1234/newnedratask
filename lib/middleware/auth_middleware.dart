import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../uit/all_string_const.dart';
import '../uit/storage.dart';


class AuthMiddleWare extends GetMiddleware {
 // final SecureStorage _secureStorage = SecureStorage();

  @override
  RouteSettings? redirect(String? route) {
    print("token in start ${SecureStorage.readSecureData(AllStringConst.Token)}");
    if (SecureStorage.readSecureData(AllStringConst.Token) != null) {
      return const RouteSettings(name: "/Home");

    }
  }
}
