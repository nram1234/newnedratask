import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class Tap2Profile extends GetView<HomeController> {
  const Tap2Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name : ${controller.userInfoModel?.user?.fullName}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Email : ${controller.userInfoModel?.user?.email}"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: controller.userInfoModel?.user?.products?.length,
                  itemBuilder: (context, pos) {}))
        ],
      ),
    );
  }
}
