import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/core/components/my_button.dart';
import 'package:marckit/fetchars/cart/payment_details/controller/payment_method_controller.dart';
import 'package:marckit/fetchars/cart/payment_details/view/widgets/custom_credit_card.dart';
import 'package:marckit/fetchars/cart/payment_details/view/widgets/payment_method_list_view.dart';
import '../../../../core/utils/builder_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      init: PaymentMethodController(),
      builder: (paycrl) => Scaffold(
        appBar: buildAppBar(
          title: "Payment Details",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: PymentMethodListView(),
              ),
              SliverToBoxAdapter(
                child: Obx(
                  () => CustomCreditCard(
                    formKey: paycrl.formKey.value,
                    autovalidateMode: paycrl.autovalidateMode.value,
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                    child: MyButton(
                      title: "Make a payment",
                      onPressed: () {
                        paycrl.validateAndSave(context);
                       
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
