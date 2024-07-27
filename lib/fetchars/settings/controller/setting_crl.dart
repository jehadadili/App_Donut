import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marckit/core/constants/app_strings.dart';

class SettingCrl extends GetxController {
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

  Future<String> uploadImage() async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child(AppStrings.imageuser);

    UploadTask uploadTask = storageRef
        .child('image_${DateTime.now().millisecondsSinceEpoch}.jpg')
        .putFile(itemImage);

    TaskSnapshot taskSnapshot = await uploadTask;

    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
