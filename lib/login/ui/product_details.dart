import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shareWidget/product_item.dart';
import '../controller/product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<ProductDetailsController>(builder: (logic) {
        return logic.getProductById == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            :

          ProdectItem(
          product: logic.getProductById!.product,
        );
      })),
    );
  }
}
