import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marckit/core/components/my_button.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/assets_data.dart';
import 'package:marckit/fetchars/pages_start/init_start_view.dart';

import '../../core/constants/app_size.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: Stack(
        children: [
          Image.asset(
            AssetsData.getStated,
            width: Sizes.width(context),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 700).r,
            child: Center(
              child: MyButton(
                title: "GeT Started",
                backgroundColor: AppColors.white,
                color: AppColors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const InitStartView();
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
