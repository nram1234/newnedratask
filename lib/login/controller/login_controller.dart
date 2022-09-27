
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../uit/all_string_const.dart';
import '../../rep/api/login_api.dart';
import '../../rep/json_model/logIn_model.dart';
import '../../uit/storage.dart';

class LogingController extends GetxController{
  final formKey = GlobalKey<FormState>();
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();

bool islogin=false;
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


  logIng()async{
  if(formKey.currentState!.validate()){
    islogin=true;
    update();
    LogInAPI logInAPI=LogInAPI();
    Map <String,dynamic>a={};
    a['email']  =email.text;
    a['password']  =password.text;



    logInAPI.post(a).then((value) async{

      LogInModel data=value as LogInModel;

      if(data.status==200){

        await SecureStorage.writeSecureData(key: AllStringConst.Token,value: data.token!);

        Get.offAllNamed("Home");
      }else{

        Get.snackbar("", data.message!);
      }
      islogin=false;
update();

    }) ;

  }
  }



}