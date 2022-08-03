import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputWidget extends StatelessWidget {
  final controller = Get.find<SignUpController>();
  final homeCtrl = Get.find<HomeController>();
  TextEditingController? inputController = TextEditingController();

  String? hintText;
  InputWidget({Key? key, required this.inputController, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "لطفا نام خود را وارد کنید";
          }
        },
        textAlign: TextAlign.start,
        controller: inputController,
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
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black.withOpacity(0.5))),
      ),
    );
  }
}
