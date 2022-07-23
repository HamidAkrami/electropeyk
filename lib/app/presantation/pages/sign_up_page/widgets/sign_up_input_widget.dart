import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpInputWidget extends StatelessWidget {
  final controller = Get.find<SignUpController>();
  TextEditingController? inputController = TextEditingController();
  Function? onTap;
  SignUpInputWidget({Key? key, this.inputController, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        onSubmitted: (value) {
          controller.warningVisible!.value = true;
          print(controller.warningVisible!.value);
        },
        onTap: () {
          controller.warningVisible!.value = false;
          print(controller.warningVisible!.value);
        },
        textAlign: TextAlign.start,
        controller: controller.userNameController,
        style: MyTextStyle().style8,
        showCursor: false,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xff1980FF), width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xff1980FF), width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            fillColor: const Color(0xffF2F2F7),
            hintText: "نام و نام خانوادگی",
            hintStyle: MyTextStyle().style12),
      ),
    );
  }
}
