import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/pages/login/widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends GetView<LoginController> {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                      left: size.width * 0.2,
                      top: size.height * 0.1 - 36,
                      child: Image.asset(
                        "assets/images/logoWhite.png",
                        color: const Color(0xff1980FF),
                      ))
                ],
              ),
            ),
            !controller.warningTextVisible.value
                ? const Expanded(child: SizedBox())
                : Container(),
            Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "کد ارسال شده به شماره 09351234567 را وارد نمایید",
                            style: MyTextStyle().style10,
                          ),
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: VerificationInput(
                                  focusIndex: controller.focusIndex.value,
                                  index: 0,
                                  verificationController:
                                      controller.verificationController1!),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: VerificationInput(
                                  focusIndex: controller.focusIndex.value,
                                  index: 1,
                                  verificationController:
                                      controller.verificationController2!),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: VerificationInput(
                                  focusIndex: controller.focusIndex.value,
                                  index: 2,
                                  verificationController:
                                      controller.verificationController3!),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: VerificationInput(
                                  focusIndex: controller.focusIndex.value,
                                  index: 3,
                                  verificationController:
                                      controller.verificationController4!),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: VerificationInput(
                                  focusIndex: controller.focusIndex.value,
                                  index: 4,
                                  verificationController:
                                      controller.verificationController5!),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      controller.warningTextVisible.value
                          ? Expanded(child: SizedBox())
                          : Container(),
                      controller.warningTextVisible.value
                          ? WarningBox(
                              text:
                                  "کد 5 رقمی ارسال شده به شماره موبایل خود را در کادر بالا وارد نمایید")
                          : SizedBox(height: size.height * 0.09),
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: ButtonWidget(
                          onPress: ontap,
                          text: "ورود / ثبت نام",
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }

  ontap() {
    Get.toNamed(AppRoutes.signUpPage);
  }
}
