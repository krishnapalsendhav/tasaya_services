import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasaya_services/views/login_page.dart';
import 'package:tasaya_services/views/services_page.dart';

import 'constant/theme.dart';
import 'controller/app_controller.dart';
import 'controller/location_controller.dart';
import 'controller/services_controller.dart';
import 'model/services_login_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  _registerAdapter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LocationController locationController = Get.put(LocationController());
  final AppController controller = Get.put(AppController());
  final ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Tasaya Services',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: Obx(() => serviceController.isBoxOpen.value
            ? serviceController.profile == null
                ? LoginPage()
                : ServicesPage()
            : Container(
                color: Get.theme.scaffoldBackgroundColor,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )));
  }
}

void _registerAdapter() {
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(AadharAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(AddressAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(LatlangAdapter());
  }
  if (!Hive.isAdapterRegistered(6)) {
    Hive.registerAdapter(BankDetailsAdapter());
  }
  if (!Hive.isAdapterRegistered(7)) {
    Hive.registerAdapter(ExperienceAdapter());
  }
  if (!Hive.isAdapterRegistered(8)) {
    Hive.registerAdapter(CategoryAdapter());
  }
}
