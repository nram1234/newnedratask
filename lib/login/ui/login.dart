

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../uit/app_colors.dart';
import '../../shareWidget/custom_button.dart';
import '../controller/login_controller.dart';

class Login extends GetView<LogingController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(key: controller.formKey,
          child: Column(children: [
            Expanded(flex: 4, child: Row(
              children: [
                Expanded(child: Text("LogIn",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),)),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(validator: controller.nameValidator,controller:controller.email,
                decoration: InputDecoration(
                  hintText: "email",
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(obscureText: true,validator: controller.passwordValidator,controller: controller.password,
                decoration: InputDecoration(
                  hintText: "********",
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.remove_red_eye_rounded),
                  focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            GetBuilder<LogingController>(
                builder: (logic) {
                  return logic.islogin?CircularProgressIndicator():CustomButton(buttonColor: ColorApp.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    title: 'login',
                    height: 50,
                    width: size.width * .8,
                    onClick: controller.logIng,
                  );
                }),
            InkWell(
              onTap: () {
                Get.toNamed(
                  "/Register",
                );
              },
              child: Center(
                child: Text(
                  "signUp",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBox())
          ]),
        ),
      ),
    );
  }
}
