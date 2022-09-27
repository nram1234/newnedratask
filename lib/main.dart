import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/home_binding.dart';
import 'binding/login_binding.dart';
import 'binding/register_binding.dart';
import 'login/ui/home.dart';
import 'login/ui/login.dart';
import 'login/ui/register.dart';
import 'middleware/auth_middleware.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),initialRoute: "Home",

      getPages: [
        GetPage(name: "/", page: () =>
          Login(),bindings:[LoginBinding()] ,
            middlewares: [
              AuthMiddleWare()
            ]

        )
,GetPage(name: "/Register", page: () =>
            Register(),
            binding: RegisterBinding())
        ,GetPage(name: "/Home", page: () =>
            Home(),
            binding: HomeBinding())
      ],)
    ;
  }
}

