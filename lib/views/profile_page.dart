import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasaya_services/controller/app_controller.dart';
import 'package:tasaya_services/controller/services_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ServiceController serviceController = Get.find();
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.025),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(serviceController.profile!.avatar!),
            ),
            const SizedBox(height: 10),
            Text(
              serviceController.profile!.name!,
              style: theme.textTheme.titleMedium,
            ),
            Text(
              serviceController.profile!.email!,
              style: theme.textTheme.labelSmall,
            ),
            SizedBox(height: height * 0.025),
            ListTile(
              dense: true,
              tileColor: theme.primaryColorDark,
              title: const Text('CONTENT'),
            ),
            ListTile(
              // onTap: () => Get.to(() => MyPaymentPage(), transition: Transition.cupertino),
              minLeadingWidth: 0,
              leading: Icon(Icons.currency_rupee_rounded, color: theme.primaryColorLight),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: theme.primaryColorLight),
              title: const Text('My Payment'),
            ),
            ListTile(
              // onTap: () => Get.to(() => const NotificationPage(), transition: Transition.cupertino),
              minLeadingWidth: 0,
              leading: Icon(Icons.notifications_active_rounded, color: theme.primaryColorLight),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: theme.primaryColorLight),
              title: const Text('Notification'),
            ),
            ListTile(
              dense: true,
              tileColor: theme.primaryColorDark,
              title: const Text('PREFERANCE'),
            ),
            ListTile(
              title: const Text('Store On'),
              minLeadingWidth: 0,
              leading: Icon(Icons.storefront_rounded, color: theme.primaryColorLight),
              // trailing: Switch(activeColor: theme.primaryColor, value: controller.profile!.storeStatus == '1', onChanged: ((value) {})),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              minLeadingWidth: 0,
              leading: Icon(Icons.dark_mode_rounded, color: theme.primaryColorLight),
              trailing: Obx(
                () => Switch(
                  activeColor: theme.primaryColor,
                  value: appController.darkMode.value,
                  onChanged: (value) {
                    appController.setDarkMode(value);
                  },
                ),
              ),
            ),
            ListTile(
              onTap: () {
                serviceController.logout();
              },
              minLeadingWidth: 0,
              leading: Icon(Icons.exit_to_app_rounded, color: theme.primaryColorLight),
              title: const Text('Logout'),
            ),
            ListTile(
              dense: true,
              tileColor: theme.primaryColorDark,
              title: const Text('OTHERS'),
            ),
            ListTile(
              onTap: () {},
              minLeadingWidth: 0,
              leading: Icon(Icons.messenger_rounded, color: theme.primaryColorLight),
              title: const Text('Feedback'),
            ),
            ListTile(
              // onTap: () => Get.to(() => const PrivacyPolicyPage(), transition: Transition.cupertino),
              minLeadingWidth: 0,
              leading: Icon(Icons.lock_rounded, color: theme.primaryColorLight),
              title: const Text('Privacy Policy'),
            ),
            ListTile(
              onTap: () {},
              minLeadingWidth: 0,
              leading: Icon(Icons.info_rounded, color: theme.primaryColorLight),
              title: const Text('Help'),
            ),
            ListTile(
              // onTap: () => Get.to(() => const AboutUsPage(), transition: Transition.cupertino),
              minLeadingWidth: 0,
              leading: Icon(Icons.people_rounded, color: theme.primaryColorLight),
              title: const Text('About Us'),
            ),
            ListTile(
              // onTap: () => Get.to(() => const TermsAndConditionPage(), transition: Transition.cupertino),
              minLeadingWidth: 0,
              leading: Icon(Icons.note_rounded, color: theme.primaryColorLight),
              title: const Text('Terms & Conditions'),
            ),
          ],
        ),
      ),
    );
  }
}
