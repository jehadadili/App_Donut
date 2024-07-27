import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/utils/builder_app_bar.dart';
import 'package:marckit/fetchars/cart/thank_you_view/view/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Order Success",
        backgroundColor: AppColors.red,
        color: AppColors.white,
      ),
      body: const ThankYouViewBody(),
    );
  }
}
