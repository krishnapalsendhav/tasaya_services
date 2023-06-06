import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tasaya_services/services/services.dart';
import 'package:tasaya_services/views/services_page.dart';
import '../constant/constant_methods.dart';
import '../controller/services_controller.dart';
import 'components/two_text.dart';
import 'new_registration_page.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Services services = Services();
  RxString errorText = "".obs;
  RxBool isLoading = false.obs;
  final ServiceController servicesController = Get.find();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),
            Center(child: Image.asset('assets/images/tasaya1.png', height: height / 4)),
            ErrorContainer(errorText: errorText),
            const SizedBox(height: 10),
            TwoText(firstText: 'Welcome,', secondText: 'to Tasaya Inc.', fontSize: 20, mainAxisAlignment: MainAxisAlignment.start),
            const SizedBox(height: 20),
            Material(
              elevation: 3,
              color: theme.primaryColorDark,
              shadowColor: theme.shadowColor,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    style: theme.textTheme.titleSmall!.copyWith(color: theme.primaryColor, fontSize: 15),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Number',
                      hintStyle: TextStyle(color: theme.primaryColorLight),
                      prefixIcon: Icon(Icons.phone_android_rounded, color: theme.primaryColorLight),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 3,
              color: theme.primaryColorDark,
              shadowColor: theme.shadowColor,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    style: theme.textTheme.titleSmall!.copyWith(color: theme.primaryColor, fontSize: 15),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: theme.primaryColorLight),
                      prefixIcon: Icon(Icons.password_rounded, color: theme.primaryColorLight),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => MaterialButton(
                    color: theme.primaryColor,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    disabledColor: theme.primaryColor,
                    onPressed: isLoading.value
                        ? null
                        : () async {
                            await login(_phoneNumberController, _passwordController);
                          },
                    child: isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Login',
                            style: theme.textTheme.titleSmall!.copyWith(color: Colors.white, fontSize: 16, letterSpacing: 0.5),
                          ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => Get.to(() => const NewRegistrationPage(), transition: Transition.cupertino),
                  child: Text(
                    'Register',
                    style: TextStyle(color: theme.primaryColor, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login(TextEditingController phoneController, TextEditingController passwordController) async {
    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading.value = true;
      var serviceRes = await services.serviceLogin(phoneController.text, passwordController.text);
      if (serviceRes != null) {
        if (serviceRes.status == true) {
          successMsg('${serviceRes.responseMessage}', true);
          servicesController.profile = serviceRes.user;
          servicesController.profileBox!.put('profile', servicesController.profile);
          isLoading.value = false;
          Get.offAll(() => ServicesPage());
        } else {
          isLoading.value = false;
          errorText.value = serviceRes.responseMessage!;
        }
      } else {
        isLoading.value = false;
        successMsg('Something Went Wrong!!', false);
      }
    } else {
      errorText.value = 'Enter Phone Number and Password';
    }
  }
}

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    super.key,
    required this.errorText,
  });

  final RxString errorText;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 250),
        firstCurve: Curves.ease,
        secondCurve: Curves.easeInCirc,
        crossFadeState: errorText.value != '' ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Colors.deepOrange.shade50, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                errorText.value,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
              GestureDetector(onTap: () => errorText.value = '', child: Transform.rotate(angle: -2.35, child: const Icon(FontAwesomeIcons.plus, color: Colors.red))),
            ],
          ),
        ),
        secondChild: const SizedBox(),
      ),
    );
  }
}
