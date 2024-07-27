import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';
import 'package:marckit/fetchars/details/controller/deatils_url.dart';
import '../../../core/components/my_button.dart';

class CustomDesignDetails extends StatelessWidget {
  const CustomDesignDetails({
    super.key,
    required this.image,
    required this.description,
    required this.title,
    required this.quintity,
    this.onPressed,
  });

  final String image;
  final String description;
  final String title;
  final String quintity;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final DeatilsUrl crl = Get.find<
        DeatilsUrl>(); // استخدم Get.find للعثور على الـ Controller الموجود بالفعل

    crl.setUnitPrice(double.tryParse(quintity) ?? 0.0);
    return Column(
      children: [
        Center(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: image,
            width: Sizes.width(context) / 1.5,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: Container(
              width: Sizes.width(context),
              height: Sizes.height(context),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20).w,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.red,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "About Gonut",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      description,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: crl.decreaseQuantity,
                            icon: const Icon(
                              Icons.remove,
                            )),
                        GetBuilder<DeatilsUrl>(
                          init: DeatilsUrl(),
                          builder: (crl) {
                            return Text(
                              "${crl.quantity.value}",
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: crl.increaseQuantity,
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<DeatilsUrl>(
                            init: DeatilsUrl(),
                            builder: (crl) {
                              return Text(
                                "JOD ${crl.totalPrice.value.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: Sizes.allSizes(context) / 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          MyButton(
                            width: 240.w,
                            title: "Add Cart",
                            onPressed: onPressed,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
