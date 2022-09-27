import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../rep/api/add_product.dart';
import '../../rep/api/all_products.dart';
import '../../rep/api/user_info_api.dart';
import '../../rep/json_model/all-products.dart';
import '../../rep/json_model/user_info_model.dart';
import '../../uit/all_string_const.dart';

import '../../uit/storage.dart';
import '../ui/tap1_all_products.dart';
import '../ui/tap2_profile.dart';
import '../ui/tap3_add_product.dart';

class HomeController extends GetxController {
  AllProductsModel? allProductsModel;
  UserInfoModel? userInfoModel;

//  PageController pageController=PageController();
  File? file;
  int index = 0;
  bool addProduct = false;

  List<Widget> screens = [AllProducts(), Tap2Profile(), Tap3AddProduct()];

  chingePage(int i) {
    print("theindex id =$i");
    index = i;

    if (i == 0) {
      getAllProducts();
      update();
    } else if (i == 1) {
      getUserInfo();
      update();
    } else {
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getAllProducts();
  }

  getAllProducts() {
    RegisterAPI logInAPI = RegisterAPI();
    print("i get getAllProducts");

    logInAPI.getData().then((value) {
      allProductsModel = value as AllProductsModel;

      update();
    });
  }

  getUserInfo() {
    UserInfoAPI userInfoAPI = UserInfoAPI();

    userInfoAPI.dioSingleton.dio.options = d.BaseOptions(headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${SecureStorage.readSecureData(AllStringConst.Token)}',

      //  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYzMzJkZjA4NTk1NGUzYjM3YTI2MWViNyJ9LCJpYXQiOjE2NjQyNzgyODAsImV4cCI6MTY2Njg3MDI4MH0.utLqzyB6By1X6TZvwbbqZLBfr4lkshWXpmgn_xmo0Co',
    });

    userInfoAPI.getData().then((value) {
      userInfoModel = value as UserInfoModel;

      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    //  getAllProducts();
    // getUserInfo();
  }

  TextEditingController prodactName = TextEditingController();
  TextEditingController colorName = TextEditingController();
  TextEditingController colorimage = TextEditingController();
  TextEditingController productSizes = TextEditingController();
  TextEditingController variantPrice = TextEditingController();
  TextEditingController variantColor = TextEditingController();
  TextEditingController variantSize = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  chossImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      update();
    }
  }

  addProductReq({required File file}) async {
    AddProductAPI addProductAPI = AddProductAPI();
    addProductAPI.dioSingleton.dio.options = d.BaseOptions(headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${SecureStorage.readSecureData(AllStringConst.Token)}',
    });

    String fileName = file.path.split('/').last;
    addProduct = true;
    update();

    // Map<String, dynamic> a = {};
    // a['productName'] = prodactName.text;
    // a['productColors[0][colorName]'] = colorName.text;
    // a["productColors[0][colorImages]"]  =await d.MultipartFile.fromFile(file.path,
    //   filename: fileName, contentType:   MediaType('image', 'png'));
    //
    // a["productSizes[0]"] = productSizes.text.split(",");
    // a["productVariations[0][variantPrice]"] = variantPrice.text;
    // a["productVariations[0][variantAttributes][variantSize]"] =
    //     variantSize.text.split(",");

    addProductAPI.post({  "mode": "formdata",
      'productName': prodactName.text,
     // 'productColors[0][colorName]': p.text,
      'productSizes[0]': productSizes.text.split(","),
      'productVariations[0][variantPrice]': variantPrice.text.split(","),
      'productVariations[0][variantAttributes][variantColor][colorName]': colorName.text,
      'productVariations[0][variantAttributes][variantSize]': variantSize.text//,
    // "productColors[0][colorImages]":await d.MultipartFile.fromFile(file.path,
    // filename: fileName, contentType:   MediaType('image', 'png'))
    }).then((value) {
      addProduct = false;
      update();

      Get.snackbar("", "Add");
    });
  }
}
