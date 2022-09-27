
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../rep/api/all_products.dart';
import '../../rep/json_model/all-products.dart';
import '../../uit/all_string_const.dart';
import '../../rep/api/login_api.dart';
import '../../rep/json_model/logIn_model.dart';
import '../../uit/storage.dart';

class HomeController extends GetxController{
  AllProductsModel? allProductsModel;
int index=0;


  List<Widget>screens=[Container(),Container(),Container()];

  chingePage(int i){
    index=i;
    update();
  }


getAllProducts(){
  RegisterAPI logInAPI=RegisterAPI();
  
  
  logInAPI.getData().then((value) {
      allProductsModel=value as AllProductsModel;

    update();


  });
  
}
}