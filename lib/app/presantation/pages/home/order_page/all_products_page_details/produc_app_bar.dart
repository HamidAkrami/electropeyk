import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAppBar extends StatelessWidget {
  String? title;
  ProductAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff1980FF),
                ),
                Text(
                  "بازگشت",
                  style: MyTextStyle().style20,
                )
              ],
            ),
          )),
          Expanded(
              child: Text(
            title!,
            textAlign: TextAlign.center,
            style: MyTextStyle().style11,
          )),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
