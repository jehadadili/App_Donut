import 'package:flutter/material.dart';

class Sizes {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double allSizes(BuildContext context) {
    return width(context) + height(context);
  }
   static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
