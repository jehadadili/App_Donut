import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/fetchars/admin/controller/admin_crl.dart';
import 'package:marckit/fetchars/admin/home/widgets/custom_design.dart';
import 'package:marckit/fetchars/admin/home/widgets/custom_my_container.dart';

import '../../../../core/constants/app_colors.dart';
import '../../add_item.dart/view/admin_add_item_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Get.find<AdminCrl>().fetchAllData(),
        builder: (context, snapshot) {
          return GetBuilder<AdminCrl>(
              init: AdminCrl(),
              builder: (admincrl) {
                return Scaffold(
                  backgroundColor: AppColors.lightwhite,
                  body: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const CustomDesign(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: admincrl.itemsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomMyContainer(
                                image: admincrl.itemsList[index].image,
                                titel: admincrl.itemsList[index].title,
                                description:
                                    admincrl.itemsList[index].description,
                                quintity: admincrl.itemsList[index].quintity,
                                onPressedelet: () {
                                  admincrl
                                      .deleteItem(admincrl.itemsList[index].id);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Get.to(() => const AdminAddItemView());
                    },
                    backgroundColor: AppColors.red,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                );
              });
        });
  }
}
