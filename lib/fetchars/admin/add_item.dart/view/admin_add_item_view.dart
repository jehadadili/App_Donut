import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marckit/core/constants/assets_data.dart';
import 'package:marckit/core/utils/builder_app_bar.dart';

import '../../../../core/components/my_button.dart';
import '../../../../core/components/my_text_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../controller/admin_create_crl.dart';

class AdminAddItemView extends StatelessWidget {
  const AdminAddItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: buildAppBar(
        title: 'Add Item',
      ),

      body: GetBuilder<AdminCreateCrl>(
        init: AdminCreateCrl(),
        builder: (createCrl) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      createCrl.selectImage();
                    },
                    child: Visibility(
                      visible: createCrl.itemImage.path.isEmpty,
                      replacement: SizedBox(
                          width: 300,
                          height: 200,
                          child: Stack(
                            children: [
                              Image.file(createCrl.itemImage),
                              Positioned(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    createCrl.clearData();
                                  },
                                ),
                              )
                            ],
                          )),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(2, 2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetsData.iconimage,
                                  color: AppColors.pink,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Top here to add on image',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyTextField(
                    width: Sizes.width(context) / 1.3,
                    hintText: 'Title',
                    onChanged: (newVal) {
                      createCrl.setTitle(newVal);
                    },
                    validator: (newVal) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    width: Sizes.width(context) / 1.3,
                    hintText: 'Description',
                    onChanged: (newVal) {
                      createCrl.setDescription(newVal);
                    },
                    validator: (newVal) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    width: Sizes.width(context) / 1.3,
                    hintText: '\$ pris',
                    onChanged: (newVal) {
                      createCrl.setQuintity(newVal);
                    },
                    validator: (newVal) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  createCrl.isLoading
                      ? LoadingAnimationWidget.beat(
                          color: AppColors.red, size: 18)
                      : MyButton(
                          title: 'Add New Item',
                          onPressed: () {
                            createCrl.addItem(context);
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
