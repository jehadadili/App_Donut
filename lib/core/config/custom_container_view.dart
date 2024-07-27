import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/app_size.dart';

class CustomContainerView extends StatelessWidget {
  const CustomContainerView({
    super.key,
    required this.image,
    required this.description,
    required this.title,
    required this.quintity,
  });
  final String image;
  final String description;
  final String title;
  final String quintity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Container(
              width: 68,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(20)),
                  color: AppColors.lightpink),
              child: Center(
                child: Text(
                  " $quintity JOD",
                  style: TextStyle(color: AppColors.brown),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CachedNetworkImage(
            imageUrl: image,
            width: Sizes.allSizes(context) / 9,
            height: Sizes.allSizes(context) / 9,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            width: 22,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColors.red,
                        fontSize: Sizes.allSizes(context) / 70,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: Sizes.allSizes(context) / 80,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
