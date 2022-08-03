import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.2,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * 0.1,
                      color: Color(0xff1980FF),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: Get.width * 0.35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/aavatar.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Container(height: 1),
              menuItem("حساب کاربری", Image.asset("assets/icons/account.png"),
                  () {
                homeCtrl.profilePage.value = 1;
                print(homeCtrl.profilePage.value);
              }),
              Container(height: 1),
              Container(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    homeCtrl.profilePage.value = 2;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Text(
                                "27,000 ",
                                style: MyTextStyle().style1,
                              ),
                              Text(
                                "تومان",
                                style: MyTextStyle().style1,
                              )
                            ],
                          ),
                        ),
                      ),
                      menuItem("کیف پول",
                          Image.asset("assets/icons/wallet.png"), () {}),
                    ],
                  ),
                ),
              ),
              Container(height: 1),
              menuItem("اپلیکیشن مشتریان",
                  Image.asset("assets/icons/application.png"), () {}),
              Container(height: 1),
              menuItem("آدرس های شما", Image.asset("assets/icons/address.png"),
                  () {
                homeCtrl.profilePage.value = 3;
                print(homeCtrl.profilePage.value);
              }),
              Container(height: 1),
              menuItem("پشتیبانی", Image.asset("assets/icons/support.png"), () {
                Get.toNamed(AppRoutes.suportPage);
              }),
              Container(height: 1),
              menuItem("قوانین و شرایط استفاده",
                  Image.asset("assets/icons/rules.png"), () {}),
              Container(height: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "نسخه 0.1",
                  style: MyTextStyle().style16,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget menuItem(String title, Image icon, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.1,
        padding: const EdgeInsets.only(right: 16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 16, color: Colors.black)),
            const SizedBox(
              width: 10.0,
            ),
            icon
          ],
        ),
      ),
    );
  }
}
