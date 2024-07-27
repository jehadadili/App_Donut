import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.image,
    required this.titel,
    required this.pries,
    required this.orderTime,
    required this.orderData,
    this.onPressed,
  });
  final String image;
  final String titel;
  final String pries;
  final String orderTime;
  final String orderData;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context) / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.lightwhite,
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.network(
            image,
            width: Sizes.allSizes(context) / 11,
            height: Sizes.allSizes(context) / 11,
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  titel,
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.w500,
                  ),
                  //overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "JOD $pries",
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  orderData,
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  orderTime,
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          )
        ],
      ),
    );
  }
}
