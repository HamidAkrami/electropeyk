import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/address_page_details/address_page_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: Obx(
          () => Column(
            children: [
              Container(
                height: Get.height * 0.18,
                color: Color(0xff1980FF),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Get.height * 0.09,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.09 - Get.width * 0.33 / 2,
                      right: Get.width / 2 - Get.width * 0.165,
                      child: Container(
                        height: Get.width * 0.33,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/aavatar.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                        top: Get.width * 0.06,
                        left: Get.width * 0.05,
                        child: InkWell(
                          onTap: () {
                            homeCtrl.profilePage.value = 0;
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Text("آدرس ها",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(height: 1),
              Expanded(
                child: ListView(
                  children: [
                    ...homeCtrl.address.map((e) => AddressPageWidget(
                          address: e,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
