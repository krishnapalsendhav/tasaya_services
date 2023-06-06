import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/constant_methods.dart';

class AppController extends GetxController {
  RxBool darkMode = true.obs;

  Future<RxString?> pickImage(ImageSource imageSource) async {
    RxString selectedProductImagePath = ''.obs;
    try {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        selectedProductImagePath.value = pickedImage.path;
        update();
        return selectedProductImagePath;
      } else {
        successMsg('Image not Picked', false);
      }
    } catch (e) {
      errorDailog(e.toString());
      return null;
    }
    return null;
  }

  setDarkMode(bool value) {
    darkMode.value = !darkMode.value;
    if (value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    update();
  }
}
