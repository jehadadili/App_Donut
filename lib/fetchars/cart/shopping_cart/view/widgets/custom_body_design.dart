import 'package:flutter/material.dart';
import 'package:marckit/core/components/my_button.dart';
import 'package:marckit/fetchars/cart/shopping_cart/view/widgets/payment_methods_bootom_sheet.dart';

import '../../../../../core/constants/app_size.dart';

class CustomBodyDesign extends StatelessWidget {
  const CustomBodyDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Order Subtotal",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Text(
              "\$42.97",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Discount",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Text(
              "\$0",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Shipping",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Text(
              "\$8",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          height: 37,
          color: Color(0xffC7C7C7),
        ),
        Row(
          children: [
            Text(
              "Total",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "\$50.97",
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 50,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        MyButton(
          title: "Complete Payment",
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              builder: (context) {
                return const PaymentMethodsBootomSheet();
              },
            );
          },
        )
      ],
    );
  }
}
