
import 'package:get/get.dart';

import '../login/controller/login_controller.dart';
import '../login/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}
