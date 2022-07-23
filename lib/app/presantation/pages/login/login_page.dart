import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/pages/login/widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 13),
                      child: LoginInput(),
                    ),
                    controller.warningTextVisible.value
                        ? Expanded(child: SizedBox())
                        : Container(),
                    controller.warningTextVisible.value
                        ? WarningBox(
                            text:
                                "برای وارد شدن به حساب کاربری و یا ثبت نام کردن در برنامه از شماره موبایل خود استفاده نمایید")
                        : SizedBox(
                            height: size.height * 0.065,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: ButtonWidget(
                          text: "ورود / ثبت نام",
                          onPress: () {
                            ontap();
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
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
}
