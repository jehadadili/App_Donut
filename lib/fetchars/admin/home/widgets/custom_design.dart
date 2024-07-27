import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

class CustomDesign extends StatelessWidget {
  const CustomDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi Admin!",
                style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 50,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout),
              )
            ],
          ),
          Text(
            "Welcome back to your panel.",
            style: TextStyle(
                color: AppColors.grey,
                fontSize: Sizes.allSizes(context) / 80,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "List Item",
              style: TextStyle(
                  fontSize: Sizes.allSizes(context) / 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
