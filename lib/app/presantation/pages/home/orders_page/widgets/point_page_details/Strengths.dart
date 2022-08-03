import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/pte_page_point_check.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Strengths extends StatelessWidget {
  Strengths({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Text(
            "کدام مورد سبب رضایت شما شد؟",
            style: MyTextStyle().style11,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PteCheckPointPage(
                    onCheck: homeCtrl.onCheck,
                    checkItem: CheckItem(
                        index: 0, value: homeCtrl.pointCheckBox1.value),
                    text: "حضور به موقع",
                    color: homeCtrl.pointCheckBox1.value
                        ? const Color(0xff34C759)
                        : const Color(0xff1F1F24),
                  ),
                ),
                Expanded(
                  child: PteCheckPointPage(
                    onCheck: homeCtrl.onCheck,
                    checkItem: CheckItem(
                        index: 1, value: homeCtrl.pointCheckBox2.value),
                    text: "مدیریت در زمان",
                    color: homeCtrl.pointCheckBox2.value
                        ? const Color(0xff34C759)
                        : const Color(0xff1F1F24),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PteCheckPointPage(
                    onCheck: homeCtrl.onCheck,
                    checkItem: CheckItem(
                        index: 2, value: homeCtrl.pointCheckBox3.value),
                    text: "رفتار مناسب",
                    color: homeCtrl.pointCheckBox3.value
                        ? const Color(0xff34C759)
                        : const Color(0xff1F1F24),
                  ),
                ),
                Expanded(
                  child: PteCheckPointPage(
                    onCheck: homeCtrl.onCheck,
                    checkItem: CheckItem(
                        index: 3, value: homeCtrl.pointCheckBox4.value),
                    text: "کیفیت مناسب",
                    color: homeCtrl.pointCheckBox4.value
                        ? const Color(0xff34C759)
                        : const Color(0xff1F1F24),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PteCheckPointPage(
                    onCheck: homeCtrl.onCheck,
                    checkItem: CheckItem(
                        index: 4, value: homeCtrl.pointCheckBox5.value),
                    text: "قیمت مناسب",
                    color: homeCtrl.pointCheckBox5.value
                        ? const Color(0xff34C759)
                        : const Color(0xff1F1F24),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
