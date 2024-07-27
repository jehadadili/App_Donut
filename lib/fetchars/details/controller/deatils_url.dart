import 'package:get/get.dart';

class DeatilsUrl extends GetxController {
  var quantity = 1.obs;
  var unitPrice = 0.0.obs;
  var totalPrice = 0.0.obs;

  void setUnitPrice(double price) {
    unitPrice.value = price;
    calculateTotalPrice();
  }

  void increaseQuantity() {
    quantity++;
    calculateTotalPrice();
    update(); // تأكد من تحديث الواجهة
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
      calculateTotalPrice();
      update(); // تأكد من تحديث الواجهة
    }
  }

  void calculateTotalPrice() {
    totalPrice.value = quantity.value * unitPrice.value;
    update(); // تأكد من تحديث الواجهة
  }
}
