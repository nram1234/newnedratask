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
import 'package:http/http.dart' as http;
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
      'Content-Type': 'multipart/form-data',
      'Authorization':
          'Bearer ${SecureStorage.readSecureData(AllStringConst.Token)}',
    });

    String fileName = file.path.split('/').last;

    addProduct = true;
    update();
    d.FormData formData = new d.FormData.fromMap({
      "mode": "formdata",
      'productName':"iiiiiiiii" ,//prodactName.text,
      'productColors[0][colorName]': "black",
      'productSizes[0]': [1,2,5],// productSizes.text.split(","),
      'productVariations[0][variantPrice]': [1,2,5],//variantPrice.text.split(","),
      'productVariations[0][variantAttributes][variantColor][colorName]': "iiiiiiiii" ,//colorName.text,
      'productVariations[0][variantAttributes][variantSize]': 15 ,//variantSize.text,
      'productColors[0][colorImages]':   await d.MultipartFile.fromFile(file.path, filename:fileName),
    });
    Map<String, dynamic> a = {
      // "mode": "formdata",
     //  "mode": "formdata",
      'Accept': "*/*",
      'productName':"iiiiiiiii" ,//prodactName.text,
       'productColors[0][colorName]': "black",
      'productSizes[0]': [1,2,5],// productSizes.text.split(","),
     'productVariations[0][variantPrice]': [1,2,5],//variantPrice.text.split(","),
      'productVariations[0][variantAttributes][variantColor][colorName]': "iiiiiiiii" ,//colorName.text,
      'productVariations[0][variantAttributes][variantSize]': 15 ,//variantSize.text,
      'productColors[0][colorImages]':    await d.MultipartFile.fromFile(file.path, filename:fileName),


    };
    print("0"*20);
    print(file.path);
    print(addProductAPI.apiUrl());
    print(a);
    print("0"*20);
    addProductAPI.post(a// formData
    //     {
    //   // "mode": "formdata",
    //   "mode": "formdata",
    //   'productName': prodactName.text,
    //
    //   'productSizes[0]': productSizes.text.split(","),
    //   'productVariations[0][variantPrice]': variantPrice.text.split(","),
    //   'productVariations[0][variantAttributes][variantColor][colorName]': colorName.text,
    //   'productVariations[0][variantAttributes][variantSize]': variantSize.text,
    //   "productColors[0][colorImages]": await d.MultipartFile.fromFile(file.path,
    //       filename: "fileName",  ),
    // }
    ).then((value) {
      addProduct = false;
      update();

      Get.snackbar("", "Add");
    });
  }


  //test http
testHttp()async{
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYzMzJkZjA4NTk1NGUzYjM3YTI2MWViNyJ9LCJpYXQiOjE2NjQyNzgyODAsImV4cCI6MTY2Njg3MDI4MH0.utLqzyB6By1X6TZvwbbqZLBfr4lkshWXpmgn_xmo0Co'
  };
  var request = http.MultipartRequest('POST', Uri.parse('https://aroundix-flutter-test-backend.herokuapp.com/API/add-product'));
  request.fields.addAll({
    'productName': 'newwww',
    'productColors[0][colorName]': 'black',
    'productSizes[0]': '[1,55,5]',
    'productVariations[0][variantPrice]': '"55"',
    'productVariations[0][variantAttributes][variantColor][colorName]': 'orang',
    'productVariations[0][variantAttributes][variantSize]': '"555"'
  });
  request.files.add(await http.MultipartFile.fromPath('productColors[0][colorImages]', '/data/user/0/com.example.newnedratask/cache/image_picker5620987007315917525.jpg'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }
}
}
