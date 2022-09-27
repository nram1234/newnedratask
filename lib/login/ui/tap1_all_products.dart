import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shareWidget/product_item.dart';
import '../controller/home_controller.dart';

class AllProducts extends GetView<HomeController> {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return logic.allProductsModel==null?Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: logic.allProductsModel?.products?.length,
          itemBuilder: (context, pos) {
            return SizedBox(height: 200,
              child: ProdectItem(
                  product: logic.allProductsModel!.products![pos]),
            );
          });
    });
  }
}
