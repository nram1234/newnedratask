import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../uit/app_colors.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {

      return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Home")),
        body: //ListView.builder(itemBuilder: itemBuilder),
       // PageView(onPageChanged: logic.chingePage,children: logic.screens,controller:logic.pageController )


        logic.screens[logic.index]
        ,
        bottomNavigationBar: BottomNavigationBar(onTap: logic.chingePage,
          selectedItemColor: ColorApp.primaryColor,
          currentIndex: logic.index,
          unselectedItemColor: Colors.grey,

          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: ""),


            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: "")
            , BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add), label: ""),
          ],),);
    });
  }
}
