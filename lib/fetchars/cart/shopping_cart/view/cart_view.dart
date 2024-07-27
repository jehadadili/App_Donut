import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/fetchars/cart/shopping_cart/controller/cart_crl.dart';
import 'package:marckit/fetchars/cart/shopping_cart/view/widgets/custom_body_design.dart';
import 'package:marckit/fetchars/cart/shopping_cart/view/widgets/my_container.dart';

import '../../../../core/utils/builder_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<CartCrl>().fetchOrders(),
      builder: (context, snapshot) {
        return GetBuilder<CartCrl>(
          init: CartCrl(),
          builder: (crl) {
            return Scaffold(
              appBar: buildAppBar(title: "Shopping cart"),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: crl.orederitem.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyContainer(
                            image: crl.orederitem[index].image,
                            titel: crl.orederitem[index].title,
                            pries: crl.orederitem[index].quintity,
                            orderTime: crl.orederitem[index].orderTime,
                            orderData: crl.orederitem[index].orderData,
                            onPressed: () {
                              crl.deleteItem(crl.orederitem[index].id);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBodyDesign(),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
