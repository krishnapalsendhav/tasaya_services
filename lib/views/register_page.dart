import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasaya_services/views/services_page.dart';

import '../constant/constant_methods.dart';
import '../controller/services_controller.dart';
import '../model/services_login_model.dart';
import '../services/services.dart';

// ignore: must_be_immutable
class ServicesRegisterPage extends StatelessWidget {
  ServicesRegisterPage({super.key});
  final ServiceController servicesController = Get.find();
  final Services services = Services();
  RxBool isHide = false.obs;
  RxBool isLoading = false.obs;
  RxString errorText = ''.obs;
  RxBool isPersonalDetailHide = false.obs;
  RxBool isCredentailDetailsHide = true.obs;
  RxBool isAddressDetailHide = true.obs;
  RxBool isExpirenceDetailHide = true.obs;
  RxBool isBankDetailHide = true.obs;
  RxBool isShopDetailHide = true.obs;
  RxString expirenceCategoryName = ''.obs;
  RxString expirenceCategoryId = ''.obs;
  RxInt expirenceCategoryIndex = 0.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController bankHolderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController verifyAccountNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController bankMobileNumberController = TextEditingController();
  TextEditingController shopFassaiController = TextEditingController();
  TextEditingController expirenceInMonthsController = TextEditingController();
  TextEditingController expirenceCityController = TextEditingController();
  TextEditingController expirenceDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.primaryColorLight,
        automaticallyImplyLeading: false,
        leading: Center(child: GestureDetector(onTap: (() => Get.back()), child: const Icon(Icons.arrow_back_ios_new_rounded))),
        title: const Text('Registeration'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: width,
            height: height,
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        isPersonalDetailHide.toggle();
                        isCredentailDetailsHide.value = true;
                        isAddressDetailHide.value = true;
                        isExpirenceDetailHide.value = true;
                        isBankDetailHide.value = true;
                        isShopDetailHide.value = true;
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Text('PERSONAL DETAILS', style: theme.textTheme.titleSmall),
                            const Spacer(),
                            Obx(
                              () => isPersonalDetailHide.value ? const Icon(Icons.arrow_drop_up_rounded) : const Icon(Icons.arrow_drop_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isPersonalDetailHide.value) const SizedBox(height: 10),
                    if (!isPersonalDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('First Name', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: firstNameController,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter First Name',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Last Name', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: lastNameController,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter Last Name',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (!isPersonalDetailHide.value) const SizedBox(height: 10),
                    if (!isPersonalDetailHide.value) Text('Email', style: theme.textTheme.titleSmall),
                    if (!isPersonalDetailHide.value) const SizedBox(height: 2),
                    if (!isPersonalDetailHide.value)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter Email',
                          ),
                        ),
                      ),
                    if (!isPersonalDetailHide.value) const SizedBox(height: 10),
                    if (!isPersonalDetailHide.value) Text('Mobile', style: theme.textTheme.titleSmall),
                    if (!isPersonalDetailHide.value) const SizedBox(height: 2),
                    if (!isPersonalDetailHide.value)
                      Container(
                        width: width * 0.45,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter Mobile Number',
                          ),
                        ),
                      ),
                    if (!isPersonalDetailHide.value) const SizedBox(height: 10),
                    if (!isPersonalDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Password', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Create new password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Verify Password', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Re-enter Password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        isPersonalDetailHide.value = true;
                        isCredentailDetailsHide.toggle();
                        isAddressDetailHide.value = true;
                        isExpirenceDetailHide.value = true;
                        isBankDetailHide.value = true;
                        isShopDetailHide.value = true;
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Text('CREDENTIALS', style: theme.textTheme.titleSmall),
                            const Spacer(),
                            Obx(
                              () => isCredentailDetailsHide.value ? const Icon(Icons.arrow_drop_up_rounded) : const Icon(Icons.arrow_drop_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 10),
                    if (!isCredentailDetailsHide.value)
                      Container(
                        width: width,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(Icons.keyboard_control_sharp),
                        ),
                      ),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 10),
                    if (!isCredentailDetailsHide.value) Text('Aadhar Number', style: theme.textTheme.titleSmall),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 2),
                    if (!isCredentailDetailsHide.value)
                      Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: theme.primaryColorDark,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                            () => TextField(
                              controller: aadharController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: theme.primaryColor,
                              ),
                              obscureText: isHide.value,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your Aadhar Number',
                              ),
                            ),
                          )),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 10),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 10),
                    if (!isCredentailDetailsHide.value)
                      Container(
                        width: width,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(Icons.keyboard_control_sharp),
                        ),
                      ),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 10),
                    if (!isCredentailDetailsHide.value) Text('Pancard Number', style: theme.textTheme.titleSmall),
                    if (!isCredentailDetailsHide.value) const SizedBox(height: 2),
                    if (!isCredentailDetailsHide.value)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: panController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your Pancard Number',
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        isPersonalDetailHide.value = true;
                        isCredentailDetailsHide.value = true;
                        isAddressDetailHide.toggle();
                        isExpirenceDetailHide.value = true;
                        isBankDetailHide.value = true;
                        isShopDetailHide.value = true;
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Text('ADDRESS', style: theme.textTheme.titleSmall),
                            const Spacer(),
                            Obx(
                              () => isAddressDetailHide.value ? const Icon(Icons.arrow_drop_up_rounded) : const Icon(Icons.arrow_drop_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isAddressDetailHide.value) const SizedBox(height: 10),
                    if (!isAddressDetailHide.value) Text('Address Line', style: theme.textTheme.titleSmall),
                    if (!isAddressDetailHide.value) const SizedBox(height: 2),
                    if (!isAddressDetailHide.value)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: addressController,
                          keyboardType: TextInputType.streetAddress,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter Address',
                          ),
                        ),
                      ),
                    if (!isAddressDetailHide.value) const SizedBox(height: 10),
                    if (!isAddressDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('State', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: stateController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your State',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pincode', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: pincodeController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your Pincode',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (!isAddressDetailHide.value) const SizedBox(height: 10),
                    if (!isAddressDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('City', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: cityController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your City',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Locality', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: localityController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your Locality',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        isPersonalDetailHide.value = true;
                        isCredentailDetailsHide.value = true;
                        isAddressDetailHide.value = true;
                        isExpirenceDetailHide.toggle();
                        isBankDetailHide.value = true;
                        isShopDetailHide.value = true;
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Text('EXPIRENCE', style: theme.textTheme.titleSmall),
                            const Spacer(),
                            Obx(
                              () => isExpirenceDetailHide.value ? const Icon(Icons.arrow_drop_up_rounded) : const Icon(Icons.arrow_drop_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isExpirenceDetailHide.value) const SizedBox(height: 10),
                    if (!isExpirenceDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Time in Year', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: expirenceInMonthsController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your expirence Time in Year',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('City of Work', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: expirenceCityController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your City of Work',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (!isExpirenceDetailHide.value) const SizedBox(height: 10),
                    if (!isExpirenceDetailHide.value)
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                  return ListView.builder(
                                      itemCount: servicesController.servicesCategories.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(servicesController.servicesCategories[index].name ?? ''),
                                          trailing: Radio(value: servicesController.servicesCategories[index].name, groupValue: expirenceCategoryName.value, onChanged: (value) {}),
                                          onTap: () {
                                            expirenceCategoryName.value = servicesController.servicesCategories[index].name!;
                                            expirenceCategoryId.value = servicesController.servicesCategories[index].id!;
                                            Get.back();
                                          },
                                        );
                                      });
                                });
                              });
                        },
                        child: Container(
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: theme.primaryColorDark,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              Obx(() => Text(expirenceCategoryName.value == '' ? 'Select Category of Work' : expirenceCategoryName.value, style: theme.textTheme.titleSmall)),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                      ),
                    if (!isExpirenceDetailHide.value) const SizedBox(height: 10),
                    if (!isExpirenceDetailHide.value) Text('DESCRIPTION OF WORK', style: theme.textTheme.titleSmall),
                    if (!isExpirenceDetailHide.value) const SizedBox(height: 2),
                    if (!isExpirenceDetailHide.value)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          controller: expirenceDescriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your Description of Work',
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        isPersonalDetailHide.value = true;
                        isCredentailDetailsHide.value = true;
                        isAddressDetailHide.value = true;
                        isExpirenceDetailHide.value = true;
                        isBankDetailHide.toggle();
                        isShopDetailHide.value = true;
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Text('BANK DETAILS', style: theme.textTheme.titleSmall),
                            const Spacer(),
                            Obx(
                              () => isBankDetailHide.value ? const Icon(Icons.arrow_drop_up_rounded) : const Icon(Icons.arrow_drop_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isBankDetailHide.value) const SizedBox(height: 10),
                    if (!isBankDetailHide.value) Text('Holder Name', style: theme.textTheme.titleSmall),
                    if (!isBankDetailHide.value) const SizedBox(height: 2),
                    if (!isBankDetailHide.value)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: bankHolderNameController,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your Name',
                          ),
                        ),
                      ),
                    if (!isBankDetailHide.value) const SizedBox(height: 10),
                    if (!isBankDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Account Number', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: accountNumberController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your Account Number',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Re-enter Account Number', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: verifyAccountNumberController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Re-enter your Account Number',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (!isBankDetailHide.value) const SizedBox(height: 10),
                    if (!isBankDetailHide.value)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('IFSC Code', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: ifscController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your IFSC Code',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Register Mobile Number', style: theme.textTheme.titleSmall),
                                const SizedBox(height: 2),
                                Container(
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColorDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    controller: bankMobileNumberController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter your Register Mobile Number',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      color: Colors.green,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () async {
                        isLoading.value = true;
                        String userJson = userToJson(
                          User(
                              aadhar: Aadhar(img: '', number: aadharController.text),
                              pan: Aadhar(img: '', number: panController.text),
                              bankDetails: BankDetails(accountHolderName: bankHolderNameController.text, accountNumber: accountNumberController.text, ifscCode: ifscController.text, registerMobileNumber: bankMobileNumberController.text),
                              address: Address(
                                  addressLine: addressController.text,
                                  city: cityController.text,
                                  state: stateController.text,
                                  pincode: int.parse(pincodeController.text),
                                  locality: localityController.text,
                                  latlang: Latlang(latitude: 456.456, longitude: 4563.456)),
                              experience: Experience(
                                  time: double.parse(expirenceInMonthsController.text),
                                  location: expirenceCityController.text,
                                  description: expirenceDescriptionController.text,
                                  category: Category(name: expirenceCategoryName.value, id: expirenceCategoryId.value)),
                              name: "${firstNameController.text} ${lastNameController.text}",
                              email: emailController.text,
                              phone: int.parse(mobileController.text),
                              password: passwordController.text,
                              avatar: 'https://images.freeimages.com/images/large-previews/7e8/man-avatar-1632965.jpg'),
                        );

                        var response = await services.serviceRegister(userJson);
                        if (response != null) {
                          if (response.status == true) {
                            successMsg('${response.responseMessage}', true);
                            servicesController.profile = response.user;
                            servicesController.profileBox!.put('profile', servicesController.profile);
                            isLoading.value = false;
                            Get.offAll(() => ServicesPage());
                          } else {
                            isLoading.value = false;
                            errorText.value = response.responseMessage!;
                            successMsg('${response.responseMessage}', false);
                          }
                        }
                      },
                      child: Obx(() => isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  RxString printText = ''.obs;
}
