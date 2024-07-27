import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/core/constants/app_colors.dart';

import '../../../../../core/constants/app_size.dart';

class CustomBodySignIn extends StatelessWidget {
  const CustomBodySignIn({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Creat a new acount ?'.tr,
          style: TextStyle(
            fontSize: Sizes.allSizes(context) / 65,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                'sign up',
                style: TextStyle(
                    color: AppColors.lightpink,
                    fontSize: Sizes.allSizes(context) / 55,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
