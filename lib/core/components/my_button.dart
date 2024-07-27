import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';

class MyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? color;
  const MyButton({
    required this.title,
    this.width,
    this.height,
    this.onPressed,
    super.key,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 342,
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.lightpink,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: color ?? AppColors.white,
            fontSize: Sizes.allSizes(context) / 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
