import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginInput extends StatelessWidget {
  final controller = Get.find<LoginController>();
  TextEditingController? inputController = TextEditingController();
  Function? onTap;
  LoginInput({Key? key, this.inputController, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        onSubmitted: (value) {
          if (controller.warningTextVisible.value == false) {
            controller.warningTextVisible.value = true;
            print(controller.warningTextVisible.value);
          }
        },
        onTap: () {
          controller.warningTextVisible.value = false;
          print(controller.warningTextVisible.value);
        },
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
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
  TextEditingController verificationController = TextEditingController();
  Function? changeFocus;
  FocusNode? textFieldFocus = FocusNode();
  FocusNode? nextFocus;
  int? focusIndex;
  int? index;
  VerificationInput(
      {Key? key,
      this.changeFocus,
      required this.verificationController,
      this.index,
      this.focusIndex,
      this.nextFocus})
      : super(key: key) {
    if (focusIndex == index) {
      Get.focusScope!.requestFocus(textFieldFocus);
    }
  }
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          onSubmitted: onSubmited(),
          onTap: () {
            controller.warningTextVisible.value = false;
            print(controller.warningTextVisible.value);
          },
          onChanged: (Value) {
            controller.focusIndex.value++;
            if (controller.focusIndex.value >= 5) {
              Get.focusScope!.unfocus();
              onSubmited();
              print(verifyCode());
            }
          },
          focusNode: textFieldFocus,
          maxLength: 1,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
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
      ),
    );
  }
}
