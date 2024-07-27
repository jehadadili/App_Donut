import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marckit/fetchars/page_user/sign_in/widgets/custom_body_sign_in.dart';

import '../../../../core/components/my_button.dart';
import '../../../../core/components/my_text_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/assets_data.dart';
import '../../controller/auth_crl.dart';
import '../../sign_up/view/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCrl>(
        init: AuthCrl(),
        builder: (crl) {
          return Scaffold(
            body: Form(
              key: crl.loginFormKey,
              child: Stack(
                children: [
                  Image.asset(
                    AssetsData.signin,
                    width: Sizes.width(context),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: Sizes.allSizes(context) / 15,
                    left: Sizes.allSizes(context) / 15,
                    child: Image.asset(
                      AssetsData.logo,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 440, left: 10).r,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MyTextField(
                            hintText: "|  Donut@gmail.com",
                            onChanged: (newVal) {
                              crl.setEmail(newVal);
                            },
                            validator: (p0) {
                              if (!crl.userModel.email.isEmail) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 30.sp,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MyTextField(
                            obscureText: crl.isVisable,
                            hintText: "|  ******",
                            onChanged: (newVal) {
                              crl.setPassword(newVal);
                            },
                            validator: (p0) {
                              if (crl.userModel.password.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: !crl.isVisable,
                                onChanged: (value) {
                                  crl.setIsVisable();
                                },
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 60.w,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Forgot Your Password?",
                                  style: TextStyle(
                                      color: AppColors.lightpink,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20).r,
                            child: crl.isLoading
                                ? Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 150).r,
                                      child:
                                          LoadingAnimationWidget.discreteCircle(
                                              color: AppColors.red,
                                              size: 18.sp),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 20).r,
                                    child: Center(
                                      child: MyButton(
                                        title: "Sign In",
                                        onPressed: () {
                                          crl.logIn(context);
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8).r,
                            child: CustomBodySignIn(
                              onPressed: () {
                                crl.clearData();
                                Get.off(() => const SignUpView());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
