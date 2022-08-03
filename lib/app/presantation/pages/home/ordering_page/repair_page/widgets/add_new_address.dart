import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/drop_down_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  selectedItem(String value) {
    homeCtrl.selectedCity!.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: homeCtrl.newAddress.value
            ? homeCtrl.height.value = Get.height * 0.6
            : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "مشخصات آدرس جدید",
                style: MyTextStyle().style19,
              ),
            ),
            DropDownWidget(
              listLength: homeCtrl.choiceCity.length,
              list: homeCtrl.choiceCity,
              selectedItem: selectedItem,
              initValue: homeCtrl.selectedCity!.value,
            ),
            const SizedBox(
              height: 10,
            ),
            InputWidget(
                inputController: homeCtrl.addressController, hintText: "آدرس"),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Expanded(
                      child: InputWidget(
                          inputController: homeCtrl.plaqueController,
                          hintText: "طبقه")),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InputWidget(
                          inputController: homeCtrl.floorController,
                          hintText: "پلاک"))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "آدرس بر روی نقشه",
                style: MyTextStyle().style19,
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.redAccent,
            ))
          ],
        ),
      ),
    );
  }
}
