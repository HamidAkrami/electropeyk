import 'dart:ffi';

import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PteCheckPointPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  PteCheckPointPage(
      {Key? key,
      required this.text,
      required this.color,
      this.checkItem,
      this.onCheck})
      : super(key: key);
  String? text;
  Color? color = Color(0xff1F1F24);
  CheckItem? checkItem;

  ValueChanged<CheckItem>? onCheck;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          checkItem!.value = !checkItem!.value!;
          onCheck!(checkItem!);
        },
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: color!),
                  borderRadius: BorderRadius.circular(3),
                  color: checkItem!.value! && checkItem!.index! < 5
                      ? const Color(0xff34C759)
                      : checkItem!.value! && checkItem!.index! >= 5
                          ? const Color(0xffFF3B30)
                          : Colors.white),
              child: const Icon(
                Icons.done,
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text!,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 14, color: color),
            )
          ],
        ),
      ),
    );
  }
}

class CheckItem {
  bool? value;
  int? index;
  CheckItem({this.value, this.index});
}
