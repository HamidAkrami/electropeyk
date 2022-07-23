import 'package:electropeyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({Key? key}) : super(key: key);
  final signUpCtrl = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            signUpCtrl.dropDown!.value = !signUpCtrl.dropDown!.value;
            if (signUpCtrl.dropDown!.value) {
              signUpCtrl.height!.value = size.height * 0.33;
            } else {
              signUpCtrl.height!.value = 0;
            }
          },
          child: Obx(
            () => Container(
              width: double.infinity,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: signUpCtrl.dropDown!.value
                      ? IColor().LIGHT_Button_COLOR
                      : Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: IColor().DARK_PRIMARY_COLOR,
                    ),
                    Text(
                      signUpCtrl.selectedCity!.value,
                      style: MyTextStyle().style2,
                    ),
                    Container()
                  ],
                ),
              ),
            ),
          ),
        ),
        Obx(() => AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.only(top: 5),
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: signUpCtrl.height!.value,
              child: RawScrollbar(
                radius: Radius.circular(8),
                thickness: 12,
                thumbColor: IColor().LIGHT_PRIMARY_COLOR,
                child: ListView.builder(
                    itemCount: signUpCtrl.cityList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: InkWell(
                          onTap: () {
                            signUpCtrl.selectedCity!.value =
                                signUpCtrl.cityList[index];
                            signUpCtrl.dropDown!.value = false;
                            signUpCtrl.height!.value = 0;
                          },
                          child: Text(
                            signUpCtrl.cityList[index],
                            style: signUpCtrl.selectedCity!.value ==
                                    signUpCtrl.cityList[index]
                                ? MyTextStyle().style1
                                : Themes.light.textTheme.subtitle2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
              ),
            ))
      ],
    );
  }
}
