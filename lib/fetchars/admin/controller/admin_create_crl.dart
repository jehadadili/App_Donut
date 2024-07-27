import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marckit/fetchars/admin/controller/admin_crl.dart';
import 'package:marckit/fetchars/admin/model/item_model.dart';

import '../../../core/constants/app_strings.dart';

class AdminCreateCrl extends GetxController {
  ItemsModel itemsModel = ItemsModel(
    id: '',
    title: '',
    description: '',
    quintity: '',
    image: '',
    userId: '',
    orderTime: '',
    orderData: '',
    type: '',
  );

  void setTitle(String newVal) {
    itemsModel.title = newVal;
    update();
  }

  void setDescription(String newVal) {
    itemsModel.description = newVal;
    update();
  }

  void setQuintity(String newVal) {
    itemsModel.quintity = newVal;
    update();
  }

  File itemImage = File('');

  Future<File> selectImage() async {
    ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      itemImage = File(image.path);
    }

    update();
    return itemImage;
  }

  bool isLoading = false;
  void setIsLoading(bool newVal) {
    isLoading = newVal;
    update();
  }

  Future<String> uploadImage() async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child(AppStrings.donuts);

    UploadTask uploadTask = storageRef
        .child('image_${DateTime.now().millisecondsSinceEpoch}.jpg')
        .putFile(itemImage);

    TaskSnapshot taskSnapshot = await uploadTask;

    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  Future addItem(context) async {
    setIsLoading(true);

    await uploadImage().then((imageUrl) {
      itemsModel.image = imageUrl;
    });

    DocumentReference ref =
        FirebaseFirestore.instance.collection(AppStrings.donuts).doc();

    itemsModel.id = ref.id;

    await ref.set(itemsModel.toMap());

    Get.find<AdminCrl>().itemsList.add(itemsModel);

    Get.find<AdminCrl>().update();

    update();

    clearData();
    Navigator.pop(context);
    setIsLoading(false);
  }

  void clearData() {
    itemsModel = ItemsModel(
      id: '',
      title: '',
      description: '',
      quintity: '',
      image: '',
      orderTime: '',
      userId: '',
      orderData: '',
      type: '',
    );
    itemImage = File('');
    setIsLoading(false);
    update();
  }
}
