import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../rep/api/register_api.dart';
import '../../rep/json_model/register_model.dart';
import '../../uit/all_string_const.dart';
import '../../uit/storage.dart';

class RegisterController extends GetxController{

  final formKey = GlobalKey<FormState>();
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  bool isRegister=false;
  String? nameValidator  (value) {
    if (value == null || value.isEmpty) {
      return ' ';
    }
    return null;
  }
  String? passwordValidator  (value) {
    if (value == null || value.isEmpty) {
      return ' ';
    }
    return null;
  }


  register()async{
    if(formKey.currentState!.validate()){
      isRegister=true;
      update();
      RegisterAPI registerAPI=RegisterAPI();
      Map <String,dynamic>a={};
      a['fullName']  =name.text;
      a['email']  =email.text;
      a['password']  =password.text;



      registerAPI.post(a).then((value) async{

        RegisterModel data=value as RegisterModel;

        if(data.status==200){

          await SecureStorage.writeSecureData(key: AllStringConst.Token,value: data.token!);

          Get.offAllNamed("Home");
        }else{

          Get.snackbar("", data.message!);
        }
        isRegister=false;
        update();

      }) ;

    }
  }





}