import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marckit/fetchars/cart/shopping_cart/controller/cart_crl.dart';

import '../../../core/constants/app_strings.dart';
import '../../admin/model/item_model.dart';

class HomeCrl extends GetxController {
  List<ItemsModel> itemsList = [];
  List<ItemsModel> dountballs = [];
  List<ItemsModel> dountrings = [];
  List<ItemsModel> iceCream = [];
  List<ItemsModel> hotDrinks = [];
  List<ItemsModel> coldDrinks = [];
  Future<List<ItemsModel>> fetchAllData() async {
    itemsList.clear();
    dountrings.clear();
    dountballs.clear();
    iceCream.clear();
    hotDrinks.clear();
    coldDrinks.clear();

    try {
      QuerySnapshot<Map<String, dynamic>> getData =
          await FirebaseFirestore.instance
              .collection(AppStrings.donuts)
              // .where('quintity', isEqualTo: '3')
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> element
          in getData.docs) {
        itemsList.add(ItemsModel.fromQuery(element));
      }
      for (ItemsModel element in itemsList) {
        if (element.type == 'dountrings') {
          dountrings.add(element);
        } else if (element.type == 'dountballs') {
          dountballs.add(element);
        } else if (element.type == 'iceCream') {
          iceCream.add(element);
        } else if (element.type == 'hotDrinks') {
          hotDrinks.add(element);
        } else if (element.type == 'coldDrinks') {
          coldDrinks.add(element);
        }
      }
    } catch (e) {
      log(e.toString());
    }

    update();
    return itemsList;
  }

  Future<void> deleteItem(String itemId) async {
    itemsList.removeWhere((item) => item.id == itemId);

    await FirebaseFirestore.instance
        .collection(AppStrings.donuts)
        .doc(itemId)
        .delete();

    update();
  }

  Future<void> orderItem(BuildContext context, ItemsModel itemsModel) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection(AppStrings.orders).doc();

    itemsModel.userId = FirebaseAuth.instance.currentUser!.uid;

    // الحصول على الوقت والتاريخ الحاليين
    DateTime now = DateTime.now();

    // تنسيق التاريخ والوقت
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    // دمج التاريخ والوقت معاً
    itemsModel.orderData = formattedDate;
    itemsModel.orderTime = formattedTime;

    log(itemsModel.orderData);
    ref.set(itemsModel.toMap()).then((val) {
      log('Done');
    });

    Get.find<CartCrl>().orederitem.add(itemsModel);
    Get.find<CartCrl>().update();

    Navigator.pop(context);
    update();
  }
}
