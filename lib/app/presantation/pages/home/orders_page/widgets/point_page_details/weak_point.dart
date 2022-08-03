import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/pte_page_point_check.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeakPoint extends StatelessWidget {
  WeakPoint({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "کدام مورد سبب نارضایتی شما شد؟",
                style: MyTextStyle().style11,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: PteCheckPointPage(
                      onCheck: homeCtrl.onCheck,
                      checkItem: CheckItem(
                          index: 5, value: homeCtrl.pointCheckBox6.value),
                      text: "عدم حضور به موقع",
                      color: homeCtrl.pointCheckBox6.value
                          ? const Color(0xffFF3B30)
                          : const Color(0xff1F1F24),
                    ),
                  ),
                  Expanded(
                    child: PteCheckPointPage(
                      onCheck: homeCtrl.onCheck,
                      checkItem: CheckItem(
                          index: 6, value: homeCtrl.pointCheckBox7.value),
                      text: "عدم مدیریت در زمان",
                      color: homeCtrl.pointCheckBox7.value
                          ? const Color(0xffFF3B30)
                          : const Color(0xff1F1F24),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: PteCheckPointPage(
                      onCheck: homeCtrl.onCheck,
                      checkItem: CheckItem(
                          index: 7, value: homeCtrl.pointCheckBox8.value),
                      text: "رفتار نامناسب",
                      color: homeCtrl.pointCheckBox8.value
                          ? const Color(0xffFF3B30)
                          : const Color(0xff1F1F24),
                    ),
                  ),
                  Expanded(
                    child: PteCheckPointPage(
                      onCheck: homeCtrl.onCheck,
                      checkItem: CheckItem(
                          index: 8, value: homeCtrl.pointCheckBox9.value),
                      text: "کیفیت نامناسب",
                      color: homeCtrl.pointCheckBox9.value
                          ? const Color(0xffFF3B30)
                          : const Color(0xff1F1F24),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: PteCheckPointPage(
                      onCheck: homeCtrl.onCheck,
                      checkItem: CheckItem(
                          index: 9, value: homeCtrl.pointCheckBox10.value),
                      text: "قیمت نامناسب",
                      color: homeCtrl.pointCheckBox10.value
                          ? const Color(0xffFF3B30)
                          : const Color(0xff1F1F24),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
