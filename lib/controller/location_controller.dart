import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/constant_methods.dart';

class LocationController extends GetxController {
  Future<Position?> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
          Get.defaultDialog(
            title: 'Location Permission',
            barrierDismissible: false,
            middleText: 'Location permission is permanently denied, we cannot request permissions.',
            textCancel: 'Exit',
            onCancel: () {
              SystemNavigator.pop();
            },
            textConfirm: 'Setting',
            onConfirm: () {
              Geolocator.openAppSettings();
              determinePosition();
            },
          );
          return null;
        } else {
          return await Geolocator.getCurrentPosition();
        }
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
          Get.defaultDialog(
            backgroundColor: Get.theme.primaryColorDark,
            title: 'Location Permission',
            titleStyle: Get.textTheme.titleMedium,
            barrierDismissible: false,
            middleText: 'Location permission is denied.',
            textCancel: 'Exit',
            onCancel: () {
              SystemNavigator.pop();
            },
            textConfirm: 'Setting',
            onConfirm: () {
              Geolocator.openAppSettings();
              determinePosition();
            },
          );

          return null;
        } else {
          return await Geolocator.getCurrentPosition();
        }
      }

      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        return await Geolocator.getCurrentPosition();
      }
    } else {
      serviceEnabled = await Geolocator.openAppSettings();
      if (!serviceEnabled) {
        successMsg('Location services are disabled.', false);
        return null;
      } else {
        return await Geolocator.getCurrentPosition();
      }
    }
    return null;
  }

  @override
  void onInit() {
    determinePosition();
    super.onInit();
  }
}
