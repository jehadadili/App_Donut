import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/fetchars/admin/model/item_model.dart';
import 'package:marckit/fetchars/details/widgets/custom_design_details.dart';
import 'package:marckit/fetchars/home/controller/home_crl.dart';

import '../../../core/utils/builder_app_bar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightwhite,
      appBar: buildAppBar(
        title: "Details",
        backgroundColor: AppColors.lightwhite,
      ),
      body: GetBuilder<HomeCrl>(
          init: HomeCrl(),
          builder: (crl) {
            return CustomDesignDetails(
              title: itemsModel.title,
              image: itemsModel.image,
              description: itemsModel.description,
              quintity: itemsModel.quintity,
              onPressed: () {
                crl.orderItem(context, itemsModel);
              },
            );
          }),
    );
  }
}
