import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_strings.dart';
import 'package:marckit/fetchars/admin/home/view/admin_view.dart';
import 'package:marckit/fetchars/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import 'package:marckit/fetchars/page_user/controller/auth_crl.dart';
import 'package:marckit/fetchars/page_user/sign_in/view/sign_in_view.dart';

import '../page_user/model/user_model.dart';

class InitStartView extends StatelessWidget {
  const InitStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        return GetBuilder<AuthCrl>(
          init: AuthCrl(),
          builder: (authCrl) {
            switch (snapShot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: AppColors.red, size: 18),
                );

              case ConnectionState.none:
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: AppColors.red, size: 18),
                );

              case ConnectionState.active:

                ///---يعني المستخدم عامل تسجيل دخول
                if (snapShot.hasData) {
                  return StreamBuilder<dynamic>(
                    stream: FirebaseFirestore.instance
                        .collection(AppStrings.users)
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.hasData) {
                        if (userSnapshot.data.data() == null ||
                            userSnapshot.data == null) {
                          return const SignInView();
                        } else {
                          authCrl.userModel =
                              UserModel.fromJson(userSnapshot.data.data());

                          if (authCrl.userModel.isAdmin) {
                            return const AdminView();
                          } else {
                            return const CustomCurvedNavigationBar();
                          }
                        }
                      } else {
                        return Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: AppColors.red, size: 18),
                        );
                      }
                    },
                  );
                } else {
                  return const SignInView();
                }

              default:
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
