
import 'package:get/get.dart';

import '../login/controller/login_controller.dart';
import '../login/controller/product_details_controller.dart';
import '../login/controller/register_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailsController>(ProductDetailsController());
  }
}
