import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/core/config/custom_container_view.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/fetchars/home/controller/home_crl.dart';

import '../details/view/details_view.dart';

class ColdDrinksView extends StatelessWidget {
  const ColdDrinksView({super.key});

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
                      itemCount: homecrl.coldDrinks.length,
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
                                  itemsModel: homecrl.coldDrinks[index],
                                );
                              }));
                            },
                            child: CustomContainerView(
                              image: homecrl.coldDrinks[index].image,
                              title: homecrl.coldDrinks[index].title,
                              description:
                                  homecrl.coldDrinks[index].description,
                              quintity: homecrl.coldDrinks[index].quintity,
                            ));
                      });
                }),
          );
        });
  }
}
