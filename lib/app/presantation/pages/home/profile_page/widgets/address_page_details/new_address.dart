import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/address_page_details/map_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/drop_down_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddress extends StatelessWidget {
  NewAddress({Key? key, this.index}) : super(key: key);
  int? index;
  final homeCtrl = Get.find<HomeController>();

  selectedItem(String value) {
    homeCtrl.selectedCity!.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffF2F2F7),
            body: Column(children: [
              Container(
                height: Get.height * 0.18,
                color: Color(0xff1980FF),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Get.height * 0.09,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.09 - Get.width * 0.33 / 2,
                      right: Get.width / 2 - Get.width * 0.165,
                      child: Container(
                        height: Get.width * 0.33,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/aavatar.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                        top: Get.width * 0.06,
                        left: Get.width * 0.05,
                        child: InkWell(
                          onTap: () {
                            homeCtrl.profilePage.value = 3;
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Text(index == 4 ? "آدرس جدید" : "تغییر آدرس",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    height: Get.height * 0.06,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "نام آدرس",
                        style: MyTextStyle().style12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: InputWidget(
                        inputController: homeCtrl.addressNameController,
                        hintText: "آدرس جدید"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropDownWidget(
                      listLength: homeCtrl.choiceCity.length,
                      list: homeCtrl.choiceCity,
                      selectedItem: selectedItem,
                      initValue: homeCtrl.selectedCity!.value,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InputWidget(
                        inputController: homeCtrl.addressController,
                        hintText: "آدرس"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Directionality(
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
                  ),
                  Container(
                    height: Get.height * 0.05,
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "آدرس بر روی نقشه",
                      style: MyTextStyle().style12,
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.redAccent,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ButtonWidget(
                      onPress: () {},
                      text: index == 4 ? "افزودن آدرس جدید" : "ثبت تغییرات",
                    ),
                  )
                ],
              ))
            ])));
  }
}
