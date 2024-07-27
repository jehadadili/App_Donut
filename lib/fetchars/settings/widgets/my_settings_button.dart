import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_size.dart';

class MySettingsButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;

  const MySettingsButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Sizes.width(context) / 1.2,
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightpink,
              offset: const Offset(-7, 7),
              blurRadius: 0.5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Sizes.allSizes(context) / 75,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      icon,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
