import 'package:flutter/material.dart';
import 'package:marckit/core/components/my_button.dart';

import 'package:marckit/core/constants/assets_data.dart';

import '../../../../../core/constants/app_size.dart';
import '../../../shopping_cart/view/cart_view.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              AssetsData.logo,
              width: Sizes.allSizes(context) / 6,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Your order was \n    succesfull!",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You will get a response within \n              a few minutes.",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            MyButton(
              title: "Track order",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CartView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
