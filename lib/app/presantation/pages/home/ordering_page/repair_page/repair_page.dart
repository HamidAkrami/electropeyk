import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/ordering_page/repair_page/widgets/add_new_address.dart';

import 'package:electropeyk/app/presantation/pages/home/widgets/custom_container.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/order_app_bar.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/drop_down_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/persian_calendar.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalali_table_calendar/jalali_table_calendar.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class RepairPage extends StatelessWidget {
  RepairPage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  selectedItem(String value) {
    homeCtrl.selectedAddress!.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Color(0xfffffffff),
          automaticallyImplyLeading: false,
          toolbarHeight: Get.height * 0.1,
          title: OrderAppBar(
            title: "ثبت سفارش",
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "نوع سفارش",
                style: MyTextStyle().style19,
                textAlign: TextAlign.right,
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (!homeCtrl.isRepair.value) {
                          homeCtrl.isRepair.value = true;
                        }
                        print(homeCtrl.isRepair.value);
                      },
                      child: CustomContainer(
                          enable: homeCtrl.isRepair.value,
                          title: "تعمیر",
                          iconUrl: "assets/icons/repair.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      if (homeCtrl.isRepair.value) {
                        homeCtrl.isRepair.value = false;
                      }
                      print(homeCtrl.isRepair.value);
                    },
                    child: CustomContainer(
                        enable: !homeCtrl.isRepair.value,
                        title: "نصب",
                        iconUrl: "assets/icons/install.png"),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "سفارش گیرنده",
                style: MyTextStyle().style19,
                textAlign: TextAlign.right,
              ),
            ),
            Obx(
              () => Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: const BorderSide(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: homeCtrl.isMine.value,
                              onChanged: (value) {
                                if (!homeCtrl.isMine.value) {
                                  homeCtrl.isMine.value = value!;
                                } else {
                                  return;
                                }
                              }),
                          Text(
                            "خودم",
                            style: MyTextStyle().style5,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: const BorderSide(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: !homeCtrl.isMine.value,
                              onChanged: (value) {
                                if (homeCtrl.isMine.value) {
                                  homeCtrl.isMine.value = !value!;
                                } else {
                                  return;
                                }
                              }),
                          Text(
                            "دیگری",
                            style: MyTextStyle().style5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "آدرس",
                style: MyTextStyle().style19,
                textAlign: TextAlign.right,
              ),
            ),
            DropDownWidget(
              listLength: homeCtrl.address.length,
              list: homeCtrl.address,
              selectedItem: selectedItem,
              initValue: homeCtrl.selectedAddress!.value,
            ),
            Expanded(child: AddNewAddress()),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "تاریخ",
                style: MyTextStyle().style19,
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: Get.height * 0.33,
              child: JalaliTableCalendar(
                  context: context,
                  // add the events for each day

                  //make marker for every day that have some events
                  marker: (date, events) {
                    return Positioned(
                      top: -4,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[200], shape: BoxShape.circle),
                        padding: const EdgeInsets.all(6.0),
                        child: Text((events?.length).toString()),
                      ),
                    );
                  },
                  onDaySelected: (date) {
                    print(date);
                    var pDate = PersianDate()
                        .gregorianToJalali(date.year, date.month, date.day);

                    homeCtrl.selectedDate.value =
                        "${pDate[0]}/${pDate[1]}/${pDate[2]}";
                    print(homeCtrl.selectedDate.value);
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "بازه زمانی(3 ساعت از 09 صبح تا 20 شب)",
                style: MyTextStyle().style19,
                textAlign: TextAlign.right,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Expanded(
                    child: InputWidget(
                        hintText: "از ساعت",
                        inputController: homeCtrl.timeFromController),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InputWidget(
                    hintText: "تا ساعت",
                    inputController: homeCtrl.timeToController,
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InputWidget(
              hintText: "توضیحات(در صورت نیاز)",
              inputController: homeCtrl.descriptionController,
            ),
            const SizedBox(
              height: 10,
            ),
            WarningBox(
                text: "لطفا در انتخاب تاریخ و بازه زمانی خود دقت فرمایید"),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              text: "درخواست سرویس",
              onPress: () {},
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
