import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInput extends StatelessWidget {
  final controller = Get.find<HomeController>();
  TextEditingController? inputController = TextEditingController();
  int? maxlength = 40;
  String? hintText;

  EmailInput(
      {Key? key,
      required this.inputController,
      required this.hintText,
      this.maxlength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: inputController,
      style: MyTextStyle().style8,
      showCursor: false,
      decoration: InputDecoration(
          counterText: "",
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
            color: Colors.black.withOpacity(0.4),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          )),
      maxLength: maxlength,
    );
  }
}
