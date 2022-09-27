import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class AllProducts extends GetView<HomeController> {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.allProductsModel?.products?.length,
        itemBuilder: (context, pos) {
          return Card(
            elevation: 4,
            child: Column(children: [
              Image.network(controller.allProductsModel?.products?[pos].productOptions.)
            ]),
          );
        });
  }
}
