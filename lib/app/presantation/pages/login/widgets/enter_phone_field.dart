import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EnterPhoneField extends StatelessWidget {
  final controller = Get.find<LoginController>();
  TextEditingController? inputController = TextEditingController();
  Function? onTap;
  EnterPhoneField({Key? key, this.inputController, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.left,
        controller: inputController,
        style: MyTextStyle().style9,
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
          labelStyle: MyTextStyle().style8,
          labelText: "شماره موبایل",
        ),
      ),
    );
  }
}

class VerificationInput extends StatelessWidget {
  final controller = Get.find<LoginController>();
  TextEditingController? verificationController = TextEditingController();

  FocusNode? textFieldFocus = FocusNode();
  FocusNode? focus;
  VerificationInput({
    Key? key,
    this.focus,
    this.verificationController,
  }) : super(key: key);
  String verifyCode() {
    return controller.verificationController1!.text +
        controller.verificationController2!.text +
        controller.verificationController3!.text +
        controller.verificationController4!.text +
        controller.verificationController5!.text;
  }

  onSubmited() {
    if (controller.warningTextVisible.value == false) {
      controller.warningTextVisible.value = true;
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        onChanged: (value) {
          if (value.length == 1) {
            if (focus == controller.focusNode1) {
              FocusScope.of(context).requestFocus(controller.focusNode2);
            } else if (focus == controller.focusNode2) {
              FocusScope.of(context).requestFocus(controller.focusNode3);
            } else if (focus == controller.focusNode3) {
              FocusScope.of(context).requestFocus(controller.focusNode4);
            } else if (focus == controller.focusNode4) {
              FocusScope.of(context).requestFocus(controller.focusNode5);
            } else if (focus == controller.focusNode5) {
              FocusScope.of(context).unfocus();
            }
          }
        },
        focusNode: focus,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        controller: verificationController,
        style: MyTextStyle().style7,
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
        ),
      ),
    );
  }
}
