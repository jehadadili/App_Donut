import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/core/utils/builder_app_bar.dart';
import 'package:marckit/fetchars/contact_us/contact_us_view.dart';
import 'package:marckit/fetchars/page_user/controller/auth_crl.dart';
import 'package:marckit/fetchars/settings/controller/setting_crl.dart';
import 'package:marckit/fetchars/settings/widgets/my_settings_button.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/utils/languages_dialog.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Settings",
        color: AppColors.black,
        backgroundColor: AppColors.lightpink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SettingCrl>(
                init: SettingCrl(),
                builder: (crl) {
                  return InkWell(
                    onTap: () {
                      crl.selectImage();
                    },
                    child: Visibility(
                      visible: crl.itemImage.path.isEmpty,
                      replacement: SizedBox(
                          height: Sizes.width(context) / 3,
                          width: Sizes.width(context) / 3,
                          child: Image.file(crl.itemImage)),
                      child: Column(
                        children: [
                          Container(
                            height: Sizes.width(context) / 3,
                            width: Sizes.width(context) / 3,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(2, 2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Text(
              Get.find<AuthCrl>().userModel.username,
              style: TextStyle(
                color: AppColors.black,
                fontSize: Sizes.allSizes(context) / 75,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
            MySettingsButton(
              onTap: () {
                languagesDialog(context);
              },
              title: 'Languages',
              icon: Icons.language,
            ),
            const SizedBox(height: 30),
            MySettingsButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ContactUsView();
                }));
              },
              title: 'Contact Us',
              icon: Icons.contact_support_rounded,
            ),
            const SizedBox(height: 30),
            MySettingsButton(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              title: 'Sign Out',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
