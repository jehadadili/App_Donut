import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_strings.dart';
import '../model/item_model.dart';

class AdminCrl extends GetxController {
  List<ItemsModel> itemsList = [];
   List<ItemsModel> dountballs = [];
  Future<List<ItemsModel>> fetchAllData() async {
    itemsList.clear();

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
          itemsList.add(element);
        } else if (element.type == 'dountballs') {
          dountballs.add(element);
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
}
