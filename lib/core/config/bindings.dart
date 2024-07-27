import 'package:get/get.dart';
import 'package:marckit/fetchars/admin/controller/admin_crl.dart';
import 'package:marckit/fetchars/bottom_navigation_bar/controllers/navigation_crl.dart';
import 'package:marckit/fetchars/details/controller/deatils_url.dart';

import '../../fetchars/admin/controller/admin_create_crl.dart';
import '../../fetchars/cart/shopping_cart/controller/cart_crl.dart';
import '../../fetchars/cart/payment_details/controller/payment_method_controller.dart';
import '../../fetchars/home/controller/home_crl.dart';
import '../../fetchars/page_user/controller/auth_crl.dart';
import '../../fetchars/settings/controller/setting_crl.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthCrl());
    Get.put(NavigationCrl());
    Get.put(PaymentMethodController());
    Get.put(AdminCreateCrl());
    Get.put(AdminCrl());
    Get.put(HomeCrl());
    Get.put(CartCrl());
    Get.put(SettingCrl());
    Get.put(DeatilsUrl());
  }
}
