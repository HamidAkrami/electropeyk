import 'dart:math';

import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPageWidget extends StatelessWidget {
  AddressPageWidget({Key? key, this.address}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  String? address;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.08,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              address == "افزودن آدرس"
                  ? InkWell(
                      onTap: () {
                        homeCtrl.profilePage.value = 4;
                      },
                      child: Container(
                        height: Get.height * 0.07,
                        width: Get.width * 0.34 + 12,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff1980FF).withOpacity(0.1),
                            border:
                                Border.all(width: 2, color: Color(0xff1980FF))),
                        child:
                            Icon(Icons.add, size: 45, color: Color(0xff1980FF)),
                      ),
                    )
                  : Row(
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: homeCtrl.removeAddress(e),
                            child: Container(
                              height: Get.height * 0.07,
                              width: Get.width * 0.14,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xffFF3B30).withOpacity(0.1),
                                  border: Border.all(
                                      width: 2, color: Color(0xffFF3B30))),
                              child: Image.asset("assets/icons/close.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            homeCtrl.profilePage.value = 5;
                          },
                          child: Container(
                            height: Get.height * 0.07,
                            width: Get.width * 0.2,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff1980FF).withOpacity(0.1),
                                border: Border.all(
                                    width: 2, color: Color(0xff1980FF))),
                            child: Image.asset("assets/icons/edit.png"),
                          ),
                        ),
                      ],
                    ),
              Text(
                address!,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
        )
      ],
    );
  }
}
