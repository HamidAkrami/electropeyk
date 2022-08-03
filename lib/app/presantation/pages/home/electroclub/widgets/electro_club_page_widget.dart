import 'dart:ui';

import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectroClubPageWidget extends StatelessWidget {
  ElectroClubPageWidget({
    Key? key,
    this.image,
    this.title,
  }) : super(key: key);
  String? title;
  String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.electroClubPageInfo, arguments: [title, image]);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(image!),
            ),
            Column(
              children: [
                Divider(
                  height: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      title!,
                      style: MyTextStyle().style11,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
