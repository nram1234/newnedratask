
import 'package:get/get.dart';

import '../login/controller/home_controller.dart';
import '../login/controller/login_controller.dart';
import '../login/controller/product_details_controller.dart';
import '../login/controller/register_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ProductDetailsController>(ProductDetailsController());

  }
}
