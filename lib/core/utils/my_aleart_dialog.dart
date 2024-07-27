import 'package:flutter/material.dart';
import 'package:marckit/core/components/my_button.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';

void myAleartDialog(BuildContext context, {String text = ''}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 80,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          MyButton(
            width: Sizes.width(context) / 4,
            title: 'ok',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
