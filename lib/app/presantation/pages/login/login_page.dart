import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/pages/login/widgets/enter_phone_field.dart';
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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                height: Get.height * 0.32,
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
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  child: EnterPhoneField(),
                ),
                Column(
                  children: [
                    !isKeyboard
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13.0, vertical: 13),
                            child: WarningBox(
                                text:
                                    "برای وارد شدن به حساب کاربری و یا ثبت نام کردن در برنامه از شماره موبایل خود استفاده نمایید"),
                          )
                        : SizedBox(
                            height: size.height * 0.065,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: ButtonWidget(
                          text: "ورود / ثبت نام",
                          onPress: () {
                            Get.toNamed(AppRoutes.verificationPage);
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
