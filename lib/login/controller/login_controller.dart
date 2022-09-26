
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../all_string_const.dart';
import '../../rep/api/login_api.dart';
import '../../rep/json_model/logIn_odel.dart';
import '../../storage.dart';

class LogingController extends GetxController{
  final formKey = GlobalKey<FormState>();
TextEditingController username=TextEditingController();
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
    a['job_num']  =username.text;
    a['password']  =password.text;



    logInAPI.post(a).then((value) async{

      LogInModel data=value as LogInModel;

      if(data.status==true){

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