import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';

class CustomMyContainer extends StatelessWidget {
  const CustomMyContainer({
    super.key,
    required this.image,
    required this.titel,
    required this.description,
    required this.quintity,
    this.onPressedelet,
  });
  final String image;
  final String titel;
  final String description;
  final String quintity;
  final void Function()? onPressedelet;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context) / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Image.network(
            image,
            width: Sizes.allSizes(context) / 11,
            height: Sizes.allSizes(context) / 11,
          ),
          const SizedBox(
            width: 10,
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
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Sizes.allSizes(context) / 90,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 2, // تغيير maxLines إلى 2
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "JOD  $quintity",
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.blue,
                        )),
                    IconButton(
                        onPressed: onPressedelet,
                        icon: Icon(
                          Icons.delete,
                          color: AppColors.red,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
