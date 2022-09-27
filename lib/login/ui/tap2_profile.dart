import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shareWidget/product_item.dart';
import '../controller/home_controller.dart';

class Tap2Profile extends GetView<HomeController> {
  const Tap2Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      print("ooooooooooooooooooooooooooooooooooooooooooo");
      return logic.userInfoModel==null?Center(child: CircularProgressIndicator(),):Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name : ${logic.userInfoModel?.user?.fullName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Email : ${logic.userInfoModel?.user?.email}"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: logic.userInfoModel?.user?.products?.length,
                  itemBuilder: (context, pos) {
                    return SizedBox(height: 200,
                      child: ProdectItem(
                          product: logic.userInfoModel!.user!
                              .products![pos]),
                    );
                  }))
        ],
      );
    });
  }
}
