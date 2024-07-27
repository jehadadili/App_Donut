import 'package:flutter/material.dart';

AppBar buildAppBar({
  required final String title,
  List<Widget>? actions,
  Color? backgroundColor,
  Color? color,
  PreferredSizeWidget? bottom,
  double? toolbarHeight
}) {
  return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      toolbarHeight: toolbarHeight,
      bottom:bottom ,
      iconTheme: const IconThemeData(size: 30),
      actions: actions);
}
