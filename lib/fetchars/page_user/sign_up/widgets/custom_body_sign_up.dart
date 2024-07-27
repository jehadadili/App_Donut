import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_size.dart';

class CustomBodySignUp extends StatelessWidget {
  const CustomBodySignUp({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an acount ?',
          style: TextStyle(
            fontSize: Sizes.allSizes(context) / 65,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: AppColors.red,
                    fontSize: Sizes.allSizes(context) / 55,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
