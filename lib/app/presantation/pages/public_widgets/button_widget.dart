import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({Key? key, this.onPress, this.text}) : super(key: key);

  VoidCallback? onPress;
  String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Container(
        height: Get.height * 0.08,
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          text!,
          style: MyTextStyle().style6,
        ),
      ),
    );
  }
}
