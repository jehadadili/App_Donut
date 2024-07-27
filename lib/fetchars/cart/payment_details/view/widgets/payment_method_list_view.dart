import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/fetchars/cart/payment_details/view/widgets/payment_method_item.dart';

import '../../controller/payment_method_controller.dart'; // افترض أن الملف موجود هنا

class PymentMethodListView extends StatelessWidget {
  const PymentMethodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      init: PaymentMethodController(),
      builder: (paycrl) => SizedBox(
        height: 62,
        child: ListView.builder(
          itemCount: paycrl.paymentMethodItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  paycrl.setActiveIndex(index);
                },
                child: PymentMethodItem(
                  isActive: paycrl.activeIndex == index,
                  image: paycrl.paymentMethodItem[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
