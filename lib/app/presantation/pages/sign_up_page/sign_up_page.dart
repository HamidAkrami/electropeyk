import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/pages/login/widgets/enter_phone_field.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/drop_down_widget.dart';
import 'package:electropeyk/app/presantation/pages/sign_up_page/widgets/privacy_dialog.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({Key? key}) : super(key: key);
  final loginCtrl = Get.find<LoginController>();
  selectedItem(String value) {
    controller.selectedCity!.value = value;
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1564",
                    style: MyTextStyle().style5,
                  ),
                  Image.asset("assets/icons/call.png")
                ],
              ),
            ),
            Container(
              height: Get.height * 0.25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: size.height * 0.1 - 36,
                      child: Image.asset(
                        "assets/images/logoWhite.png",
                        color: const Color(0xff1980FF),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: controller.warningVisible!.value
                        ? 0
                        : size.height * 0.03,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                    child: InputWidget(
                        hintText: "نام و نام خانوادگی",
                        inputController: controller.userNameController),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                    child: DropDownWidget(
                      selectedItem: selectedItem,
                      initValue: controller.selectedCity!.value,
                      list: controller.cityList,
                      listLength: controller.cityList.length,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: ".حریم خصوصی و شرایط استفاده",
                            style: MyTextStyle().style3,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openDialog();
                              }),
                        TextSpan(
                            text: " را مطالعه نموده و با کلیه موارد آن موافقم",
                            style: MyTextStyle().style13)
                      ])),
                      // Text(
                      //   ".حریم خصوصی و شرایط استفاده را مطالعه نموده و با کلیه موارد آن موافقم",
                      //   style: Themes.light.textTheme.headlineLarge,
                      // ),
                      Obx(
                        () => Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            side: const BorderSide(
                              color: Colors.black,
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: controller.isAgree!.value,
                            onChanged: (value) {
                              controller.isAgree!.value = value!;
                            }),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: !isKeyboard
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: WarningBox(
                                      text:
                                          "برای ساخت حساب کاربری در برنامه ما لطفا نام و نام خانوادگی و شهر محل سکونت خود را وارد نمایید"),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 5),
                      child: !isKeyboard
                          ? ButtonWidget(
                              text: "ثبت نام",
                              onPress: () {
                                controller.userName!.value =
                                    controller.userNameController.text;
                                if (controller.isAgree!.value &&
                                    controller
                                        .userNameController.text.isNotEmpty) {
                                  Get.snackbar(
                                      "${controller.userName!.value} عزیز ",
                                      "شما با موفقیت وارد شدید",
                                      snackStyle: SnackStyle.FLOATING,
                                      colorText: Color(0xff1980FF));
                                  Get.offNamed(AppRoutes.homePage);
                                } else if (controller
                                    .userNameController.text.isEmpty) {
                                  Get.snackbar(
                                      "خطا", "لطفا نام کاربری خود را وارد کنید",
                                      snackStyle: SnackStyle.FLOATING,
                                      colorText: Colors.redAccent);
                                  return;
                                } else if (controller.isAgree!.value == false) {
                                  Get.snackbar("خطا",
                                      "لطفا موافقت خود با شرایط اپ را تایید کنید",
                                      snackStyle: SnackStyle.FLOATING,
                                      colorText: Colors.redAccent);
                                  return;
                                }
                              })
                          : Container()),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  ontap() {
    Get.toNamed(AppRoutes.verificationPage);
  }

  openDialog() {
    Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 18),
        title: "حریم خصوصی و شرایط استفاده",
        titleStyle: MyTextStyle().style11,
        content: PrivacyDialog());
  }
}
