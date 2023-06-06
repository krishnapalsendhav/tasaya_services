import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../constant/constant_methods.dart';
import '../controller/services_controller.dart';
import '../model/services_login_model.dart';
import '../services/services.dart';
import 'login_page.dart';
import 'services_page.dart';

// ignore: must_be_immutable
class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({super.key});

  @override
  State<NewRegistrationPage> createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
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

  File? aadharImage;

  File? pancardImage;

  RxString expirenceCategoryName = ''.obs;

  RxString expirenceCategoryId = ''.obs;

  RxInt expirenceCategoryIndex = 0.obs;

  RxBool isLoading = false.obs;

  RxString errorText = ''.obs;

  List<String> headLines = <String>[
    'Personal Details',
    'Credentails',
    'Address',
    'Work Experience',
    'Bank Details',
  ];

  RxInt current = 0.obs;

  final ServiceController servicesController = Get.find();

  final Services services = Services();

  PageController pageController = PageController();

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
        title: Obx(() => Text(headLines[current.value])),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) => current.value = index,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 10),
                    Text('Email', style: theme.textTheme.titleSmall),
                    const SizedBox(height: 2),
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
                    const SizedBox(height: 10),
                    Text('Mobile', style: theme.textTheme.titleSmall),
                    const SizedBox(height: 2),
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
                    const SizedBox(height: 10),
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
                  ],
                ),
              ),
              Credentials(width, height, context, theme),
              AddressDetail(
                  width: width, height: height, theme: theme, addressController: addressController, stateController: stateController, pincodeController: pincodeController, cityController: cityController, localityController: localityController),
              WorkExperience(
                  width: width,
                  height: height,
                  theme: theme,
                  expirenceInMonthsController: expirenceInMonthsController,
                  expirenceCityController: expirenceCityController,
                  servicesController: servicesController,
                  expirenceCategoryName: expirenceCategoryName,
                  expirenceCategoryId: expirenceCategoryId,
                  expirenceDescriptionController: expirenceDescriptionController),
              BankDetail(
                  width: width,
                  height: height,
                  theme: theme,
                  bankHolderNameController: bankHolderNameController,
                  accountNumberController: accountNumberController,
                  verifyAccountNumberController: verifyAccountNumberController,
                  ifscController: ifscController,
                  bankMobileNumberController: bankMobileNumberController),
            ],
          ),
          Positioned(
            bottom: 2,
            left: 5,
            right: 5,
            child: ErrorContainer(errorText: errorText),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.12,
        width: width,
        color: theme.primaryColorDark,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: headLines.map((url) {
                int index = headLines.indexOf(url);

                return Obx(() => AnimatedContainer(
                      width: current.value == index ? 18 : 6,
                      height: current.value == index ? 6 : 6,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                        color: current.value == index ? Theme.of(context).primaryColor : Colors.grey,
                        borderRadius: current.value == index ? const BorderRadius.all(Radius.circular(15)) : const BorderRadius.all(Radius.circular(15)),
                      ),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      // child: current.value == index ? Center(child: Text('${index + 1}/${headLines.length}')) : null,
                    ));
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => MaterialButton(
                    shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      1,
                    ),
                    disabledColor: Colors.grey,
                    onPressed: current.value == 0 ? null : () => pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
                    color: theme.primaryColor,
                    textColor: theme.primaryColorLight,
                    child: const Text('Back'),
                  ),
                ),
                Obx(
                  () => MaterialButton(
                    disabledColor: Colors.grey,
                    shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      1,
                    ),
                    onPressed: current.value == 4
                        ? () async {
                            if (firstNameController.text.isEmpty) {
                              errorText.value = 'Please enter first name';
                              // pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOutBack);
                              pageController.jumpToPage(0);
                            } else if (lastNameController.text.isEmpty) {
                              errorText.value = 'Please enter last name';
                              pageController.jumpToPage(0);
                            } else if (emailController.text.isEmpty) {
                              errorText.value = 'Please enter email';
                              pageController.jumpToPage(0);
                            } else if (mobileController.text.isEmpty) {
                              errorText.value = 'Please enter mobile number';
                              pageController.jumpToPage(0);
                            } else if (passwordController.text.isEmpty) {
                              errorText.value = 'Please enter password';
                              pageController.jumpToPage(0);
                            } else if (confirmPasswordController.text.isEmpty) {
                              errorText.value = 'Please enter confirm password';
                              pageController.jumpToPage(0);
                            } else if (passwordController.text != confirmPasswordController.text) {
                              errorText.value = 'Password and confirm password does not match';
                              pageController.jumpToPage(0);
                            } else if (aadharImage == null) {
                              errorText.value = 'Please upload aadhar';
                              pageController.jumpToPage(1);
                            } else if (aadharController.text.isEmpty) {
                              errorText.value = 'Please enter aadhar number';
                              pageController.jumpToPage(1);
                            } else if (pancardImage == null) {
                              errorText.value = 'Please upload pancard';
                              pageController.jumpToPage(1);
                            } else if (panController.text.isEmpty) {
                              errorText.value = 'Please enter pan number';
                              pageController.jumpToPage(1);
                            } else if (addressController.text.isEmpty) {
                              errorText.value = 'Please enter address';
                              pageController.jumpToPage(2);
                            } else if (stateController.text.isEmpty) {
                              errorText.value = 'Please enter state';
                              pageController.jumpToPage(2);
                            } else if (pincodeController.text.isEmpty) {
                              errorText.value = 'Please enter pincode';
                              pageController.jumpToPage(2);
                            } else if (cityController.text.isEmpty) {
                              errorText.value = 'Please enter city';
                              pageController.jumpToPage(2);
                            } else if (localityController.text.isEmpty) {
                              errorText.value = 'Please enter locality';
                              pageController.jumpToPage(2);
                            } else if (expirenceInMonthsController.text.isEmpty) {
                              errorText.value = 'Please enter expirence in months';
                              pageController.jumpToPage(3);
                            } else if (expirenceCityController.text.isEmpty) {
                              errorText.value = 'Please enter expirence city';
                              pageController.jumpToPage(3);
                            } else if (expirenceCategoryName.value.isEmpty) {
                              errorText.value = 'Please select expirence category';
                              pageController.jumpToPage(3);
                            } else if (expirenceDescriptionController.text.isEmpty) {
                              errorText.value = 'Please enter expirence description';
                              pageController.jumpToPage(3);
                            } else if (bankHolderNameController.text.isEmpty) {
                              errorText.value = 'Please enter bank holder name';
                              pageController.jumpToPage(4);
                            } else if (accountNumberController.text.isEmpty) {
                              errorText.value = 'Please enter account number';
                              pageController.jumpToPage(4);
                            } else if (verifyAccountNumberController.text.isEmpty) {
                              errorText.value = 'Please enter verify account number';
                              pageController.jumpToPage(4);
                            } else if (accountNumberController.text != verifyAccountNumberController.text) {
                              errorText.value = 'Account number and verify account number does not match';
                              pageController.jumpToPage(4);
                            } else {
                              await registration();
                            }
                          }
                        : () => pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
                    color: theme.primaryColor,
                    textColor: theme.primaryColorLight,
                    child: current.value == 4 ? const Text('Submit') : const Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Credentials(double width, double height, BuildContext context, ThemeData theme) => Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Container(
                      decoration: BoxDecoration(
                        color: theme.primaryColorDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: height * 0.2,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Aadhar Image', style: theme.textTheme.titleMedium),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
                                  if (img == null) {
                                    Get.rawSnackbar(message: 'Image is not picked');
                                    return;
                                  }
                                  final tempImg = File(img.path);
                                  aadharImage = tempImg;
                                  setState(() {});
                                  Get.back();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(child: Icon(Icons.camera_alt_rounded)),
                                    SizedBox(height: 5),
                                    Text('Camera'),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if (img == null) {
                                    Get.rawSnackbar(message: 'Image is not picked');
                                    return;
                                  }
                                  final tempImg = File(img.path);
                                  aadharImage = tempImg;
                                  setState(() {});
                                  Get.back();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(child: Icon(Icons.image_rounded)),
                                    SizedBox(height: 5),
                                    Text('Gallery'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              },
              child: Container(
                width: width,
                height: height * 0.2,
                decoration: BoxDecoration(
                  color: theme.primaryColorDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: aadharImage != null
                    ? ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.file(aadharImage!, fit: BoxFit.cover))
                    : const Center(
                        child: Icon(FontAwesomeIcons.idCard, size: 30),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Text('Aadhar Number', style: theme.textTheme.titleSmall),
            const SizedBox(height: 2),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: theme.primaryColorDark,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: aadharController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor,
                ),
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: 'Enter your Aadhar Number',
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Container(
                      decoration: BoxDecoration(
                        color: theme.primaryColorDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: height * 0.2,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pancard Image', style: theme.textTheme.titleMedium),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
                                  if (img == null) {
                                    Get.rawSnackbar(message: 'Image is not picked');
                                    return;
                                  }
                                  final tempImg = File(img.path);
                                  pancardImage = tempImg;
                                  setState(() {});
                                  Get.back();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(child: Icon(Icons.camera_alt_rounded)),
                                    SizedBox(height: 5),
                                    Text('Camera'),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if (img == null) {
                                    Get.rawSnackbar(message: 'Image is not picked');
                                    return;
                                  }
                                  final tempImg = File(img.path);
                                  pancardImage = tempImg;
                                  setState(() {});
                                  Get.back();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(child: Icon(Icons.image_rounded)),
                                    SizedBox(height: 5),
                                    Text('Gallery'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              },
              child: Container(
                width: width,
                height: height * 0.2,
                decoration: BoxDecoration(
                  color: theme.primaryColorDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: pancardImage != null
                    ? ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.file(pancardImage!, fit: BoxFit.cover))
                    : const Center(
                        child: Icon(FontAwesomeIcons.idCard, size: 30),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Text('Pancard Number', style: theme.textTheme.titleSmall),
            const SizedBox(height: 2),
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
          ],
        ),
      );

  Future<void> registration() async {
    isLoading.value = true;
    String userJson = userToJson(
      User(
          aadhar: Aadhar(img: '', number: aadharController.text),
          pan: Aadhar(img: '', number: panController.text),
          bankDetails: BankDetails(accountHolderName: bankHolderNameController.text, accountNumber: accountNumberController.text, ifscCode: ifscController.text, registerMobileNumber: bankMobileNumberController.text),
          address: Address(
              addressLine: addressController.text, city: cityController.text, state: stateController.text, pincode: int.parse(pincodeController.text), locality: localityController.text, latlang: Latlang(latitude: 456.456, longitude: 4563.456)),
          experience: Experience(
              time: double.parse(expirenceInMonthsController.text), location: expirenceCityController.text, description: expirenceDescriptionController.text, category: Category(name: expirenceCategoryName.value, id: expirenceCategoryId.value)),
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
  }
}

class BankDetail extends StatelessWidget {
  const BankDetail({
    super.key,
    required this.width,
    required this.height,
    required this.theme,
    required this.bankHolderNameController,
    required this.accountNumberController,
    required this.verifyAccountNumberController,
    required this.ifscController,
    required this.bankMobileNumberController,
  });

  final double width;
  final double height;
  final ThemeData theme;
  final TextEditingController bankHolderNameController;
  final TextEditingController accountNumberController;
  final TextEditingController verifyAccountNumberController;
  final TextEditingController ifscController;
  final TextEditingController bankMobileNumberController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Holder Name', style: theme.textTheme.titleSmall),
          const SizedBox(height: 2),
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
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
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
        ],
      ),
    );
  }
}

class WorkExperience extends StatelessWidget {
  const WorkExperience({
    super.key,
    required this.width,
    required this.height,
    required this.theme,
    required this.expirenceInMonthsController,
    required this.expirenceCityController,
    required this.servicesController,
    required this.expirenceCategoryName,
    required this.expirenceCategoryId,
    required this.expirenceDescriptionController,
  });

  final double width;
  final double height;
  final ThemeData theme;
  final TextEditingController expirenceInMonthsController;
  final TextEditingController expirenceCityController;
  final ServiceController servicesController;
  final RxString expirenceCategoryName;
  final RxString expirenceCategoryId;
  final TextEditingController expirenceDescriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 10),
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
                              trailing: Radio(
                                  value: servicesController.servicesCategories[index].name,
                                  groupValue: expirenceCategoryName.value,
                                  onChanged: (value) {
                                    expirenceCategoryName.value = servicesController.servicesCategories[index].name!;
                                    expirenceCategoryId.value = servicesController.servicesCategories[index].id!;
                                    Get.back();
                                  }),
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
          const SizedBox(height: 10),
          Text('DESCRIPTION OF WORK', style: theme.textTheme.titleSmall),
          const SizedBox(height: 2),
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
        ],
      ),
    );
  }
}

class AddressDetail extends StatelessWidget {
  const AddressDetail({
    super.key,
    required this.width,
    required this.height,
    required this.theme,
    required this.addressController,
    required this.stateController,
    required this.pincodeController,
    required this.cityController,
    required this.localityController,
  });

  final double width;
  final double height;
  final ThemeData theme;
  final TextEditingController addressController;
  final TextEditingController stateController;
  final TextEditingController pincodeController;
  final TextEditingController cityController;
  final TextEditingController localityController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Address Line', style: theme.textTheme.titleSmall),
        const SizedBox(height: 2),
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
        const SizedBox(height: 10),
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
        const SizedBox(height: 10),
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
      ]),
    );
  }
}
