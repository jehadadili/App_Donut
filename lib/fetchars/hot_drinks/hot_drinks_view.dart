import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/core/config/custom_container_view.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/fetchars/home/controller/home_crl.dart';

import '../details/view/details_view.dart';

class HotDrinksView extends StatelessWidget {
  const HotDrinksView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Get.find<HomeCrl>().fetchAllData(),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: AppColors.lightwhite,
            body: GetBuilder<HomeCrl>(
                init: HomeCrl(),
                builder: (homecrl) {
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      itemCount: homecrl.hotDrinks.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsView(
                                  itemsModel: homecrl.hotDrinks[index],
                                );
                              }));
                            },
                            child: CustomContainerView(
                              image: homecrl.hotDrinks[index].image,
                              title: homecrl.hotDrinks[index].title,
                              description: homecrl.hotDrinks[index].description,
                              quintity: homecrl.hotDrinks[index].quintity,
                            ));
                      });
                }),
          );
        });
  }
}
