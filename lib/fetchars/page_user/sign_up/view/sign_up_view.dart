import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marckit/fetchars/page_user/controller/auth_crl.dart';
import 'package:marckit/fetchars/page_user/sign_up/widgets/custom_body_sign_up.dart';

import '../../../../../core/components/my_button.dart';
import '../../../../../core/components/my_text_field.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/assets_data.dart';
import '../../sign_in/view/sign_in_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCrl>(
        init: AuthCrl(),
        builder: (crl) {
          return Scaffold(
            body: Form(
              key: crl.signupFormKey,
              child: SingleChildScrollView(
                child: Stack(children: [
                  Image.asset(
                    AssetsData.signup,
                    width: Sizes.width(context),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 70.h,
                    left: 110.r,
                    child: Image.asset(
                      AssetsData.logo,
                      width: 160.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 270, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "user name",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MyTextField(
                          hintText: "|  Donut Delights",
                          onChanged: (newVal) {
                            crl.setName(newVal);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            size: 30.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MyTextField(
                          hintText: "|  donut@gmail.com",
                          onChanged: (newVal) {
                            crl.setEmail(newVal);
                          },
                          validator: (value) {
                            if (value == null || !value.isEmail) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 30.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        MyTextField(
                          obscureText: crl.isVisable,
                          hintText: "|  ******",
                          onChanged: (newVal) {
                            crl.setPassword(newVal);
                          },
                          validator: (value) {
                            if (value == null || value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 30.sp,
                          ),
                          onTapSuffixIcon: () {
                            crl.setIsVisable();
                          },
                          suffixIcon: crl.isVisable
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        MyTextField(
                          obscureText: crl.isVisable,
                          hintText: "|  ******",
                          onChanged: (newVal) {
                            crl.setCPassword(newVal);
                          },
                          validator: (value) {
                            if (value == null || value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 30.sp,
                          ),
                          onTapSuffixIcon: () {
                            crl.setIsVisable();
                          },
                          suffixIcon: crl.isVisable
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        crl.isLoading
                            ? LoadingAnimationWidget.discreteCircle(
                                color: AppColors.red, size: 18.sp)
                            : MyButton(
                                title: "Register",
                                onPressed: () {
                                  crl.signUp(context);
                                },
                              ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomBodySignUp(
                          onPressed: () {
                            crl.clearData();
                            Get.off(() => const SignInView());
                          },
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
