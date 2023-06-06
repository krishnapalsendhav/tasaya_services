import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/services_controller.dart';
import 'accepted_order_page.dart';
import 'order_page.dart';
import 'profile_page.dart';
import 'register_page.dart';
import 'components/two_text.dart';

// ignore: must_be_immutable
class ServicesPage extends StatelessWidget {
  ServicesPage({super.key});
  final ServiceController serviceController = Get.find();
  RxInt currentIndex = 0.obs;
  final List<Widget> body = [
    OrderPage(),
    AcceptedOrderPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: height * 0.07,
            surfaceTintColor: theme.scaffoldBackgroundColor,
            animationDuration: const Duration(seconds: 1),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (int index) => currentIndex.value = index,
            selectedIndex: currentIndex.value,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Order',
                selectedIcon: Icon(Icons.shopping_bag_rounded),
              ),
              const NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Accepted',
                selectedIcon: Icon(Icons.shopping_cart_rounded),
              ),
              NavigationDestination(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight,
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.primaryColorLight, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(serviceController.profile!.avatar!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                label: 'Profile',
                selectedIcon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight,
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.primaryColor, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(serviceController.profile!.avatar!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: SafeArea(
        child: serviceController.profile != null
            ? Obx(() => body[currentIndex.value])
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TwoText(firstText: 'Welcome to services provided by ', fontSize: 18, secondText: 'Tasaya Inc.'),
                  const SizedBox(height: 10),
                  TwoText(firstText: 'You are currently not registered for', fontSize: 18, secondText: 'Tasaya Services'),
                  const SizedBox(height: 10),
                  TwoText(firstText: 'Please Register to continue', fontSize: 18, secondText: ''),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Get.to(() => ServicesRegisterPage(), transition: Transition.cupertino),
                    child: const Text('Register'),
                  ),
                ],
              ),
      ),
    );
  }
}
