import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shareWidget/custom_button.dart';
import '../../uit/app_colors.dart';
import '../controller/home_controller.dart';

class Tap3AddProduct extends StatelessWidget {
  const Tap3AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<HomeController>(builder: (logic) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: logic.prodactName,
                  decoration: InputDecoration(
                    hintText: "prodactName",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              logic.file==null?GestureDetector(onTap: (){
                logic.chossImage();
              },child: Image.asset("assets/images/noimage.png",height: 200,)):GestureDetector(onTap: (){
        logic.chossImage();
        },child: Image.file(logic.file!,height: 200,)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: logic.colorName,
                  decoration: InputDecoration(
                    hintText: "colorName",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: logic.productSizes,
                  decoration: InputDecoration(
                    hintText: "productSizes",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: logic.variantColor,
                  decoration: InputDecoration(
                    hintText: "variantColor",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: logic.variantSize,
                  decoration: InputDecoration(
                    hintText: "variantSize",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: logic.variantPrice,
                  decoration: InputDecoration(
                    hintText: "variantSize",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),


              CustomButton(height: 50,onClick: () {
                if(logic.file!=null){
         //  logic.addProductReq(file: logic.file!);


                 logic.testHttp();

                }else{
                  Get.snackbar("", "Add all data");
                }

              }, buttonColor:ColorApp. primaryColor, title: 'Add Product', width: 100,)

            ],
          ),
        );
      }),
    );
  }
}
