import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationCrl extends GetxController {
  int selectIndex = 0;
  String currentPage = "page1";

  List<String> pageKeysList = [
    "page1",
    "page2",
    "page3",
  ];

  final navigationKeys = {
    "page1": GlobalKey<NavigatorState>(),
    "page2": GlobalKey<NavigatorState>(),
    "page3": GlobalKey<NavigatorState>(),
  };

  void selectTap(String tabItem, int index) {
    if (tabItem == currentPage) {
      navigationKeys.forEach((key, value) {
        value.currentState!.popUntil((route) => route.isFirst);
      });
    } else {
      currentPage = pageKeysList[index];
      selectIndex = index;
    }
    update();
  }
}
