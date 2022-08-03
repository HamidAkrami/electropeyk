import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/input_widgets/birthday_input.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/input_widgets/email_input.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/input_widget.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageDetails extends StatelessWidget {
  ProfilePageDetails({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  birthDay() {
    homeCtrl.userBirthDay.value =
        "${homeCtrl.profilebirthDateyear.text}/${homeCtrl.profilebirthDatemonth.text}/${homeCtrl.profilebirthDateday.text}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                right: Get.width * 0.03,
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
                top: Get.height * 0.09 - Get.width * 0.1 / 2,
                right: Get.width * 0.44,
                child: Container(
                  height: Get.width * 0.1,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image.asset("assets/icons/edit.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                  top: Get.width * 0.06,
                  left: Get.width * 0.05,
                  child: InkWell(
                    onTap: () {
                      homeCtrl.profilePage.value = 0;
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text("حساب کاربری",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Obx(
          () => Expanded(
              child: ListView(
            children: [
              Container(height: 1),
              menuItem(
                "شماره تلفن",
                "09121234567",
              ),
              Container(height: 1),
              Container(
                height: Get.height * 0.09,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !homeCtrl.isEdit.value
                        ? Text(
                            homeCtrl.userName.value,
                            style: MyTextStyle().style12,
                          )
                        : Expanded(
                            flex: 2,
                            child: EmailInput(
                                maxlength: 40,
                                inputController: homeCtrl.nameController,
                                hintText: "نام و نام خانوادگی"),
                          ),
                    Expanded(
                      child: Text("نام و نام خانوادگی",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    )
                  ],
                ),
              ),
              Container(height: 1),
              Container(
                height: Get.height * 0.09,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !homeCtrl.isEdit.value
                        ? Text(
                            homeCtrl.userEmail.value,
                            style: MyTextStyle().style12,
                          )
                        : Expanded(
                            flex: 2,
                            child: EmailInput(
                                maxlength: 40,
                                inputController: homeCtrl.emailController,
                                hintText: "ایمیل")),
                    Expanded(
                      child: Text("ایمیل",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    )
                  ],
                ),
              ),
              Container(height: 1),
              Container(
                height: Get.height * 0.09,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: !homeCtrl.isEdit.value
                          ? Text(
                              homeCtrl.userBirthDay.value,
                              style: MyTextStyle().style12,
                            )
                          : Row(
                              children: [
                                Expanded(
                                    child: BirthDayInput(
                                        focus: homeCtrl.birthfocus1,
                                        maxlength: 4,
                                        inputController:
                                            homeCtrl.profilebirthDateyear,
                                        hintText: "سال")),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: BirthDayInput(
                                        focus: homeCtrl.birthfocus2,
                                        maxlength: 2,
                                        inputController:
                                            homeCtrl.profilebirthDatemonth,
                                        hintText: "ماه")),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: BirthDayInput(
                                        focus: homeCtrl.birthfocus3,
                                        maxlength: 2,
                                        inputController:
                                            homeCtrl.profilebirthDateday,
                                        hintText: "روز")),
                              ],
                            ),
                    ),
                    Expanded(
                      child: Text("تاریخ تولد",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    )
                  ],
                ),
              ),
              Container(height: 1),
              Container(
                height: Get.height * 0.09,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !homeCtrl.isEdit.value
                          ? Text(
                              homeCtrl.sex.value,
                              style: MyTextStyle().style12,
                            )
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    homeCtrl.sex.value = "زن";
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 3,
                                          color: homeCtrl.sex.value == "زن"
                                              ? Color(0xff1980FF)
                                              : Color(0xff1980FF)
                                                  .withOpacity(0.3),
                                        )),
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 35),
                                    child: Text(
                                      "زن",
                                      style: homeCtrl.sex.value == "زن"
                                          ? MyTextStyle().style5
                                          : TextStyle(
                                              color: Color(0xff1980FF)
                                                  .withOpacity(0.3),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    homeCtrl.sex.value = "مرد";
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 3,
                                          color: homeCtrl.sex.value == "مرد"
                                              ? Color(0xff1980FF)
                                              : Color(0xff1980FF)
                                                  .withOpacity(0.3),
                                        )),
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 35),
                                    child: Text(
                                      "مرد",
                                      style: homeCtrl.sex.value == "مرد"
                                          ? MyTextStyle().style5
                                          : TextStyle(
                                              color: Color(0xff1980FF)
                                                  .withOpacity(0.3),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                      Text("جنسیت",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black))
                    ],
                  ),
                ),
              ),
              Container(height: 1),
              Container(
                height: Get.height * 0.09,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        homeCtrl.isEdit.value = !homeCtrl.isEdit.value;
                        homeCtrl.userName.value = homeCtrl.nameController.text;
                        homeCtrl.userEmail.value =
                            homeCtrl.emailController.text;
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xff1980FF),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          homeCtrl.isEdit.value == false
                              ? "تغییر اطلاعات"
                              : "ثبت تغییرات",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    Text(
                      "تغییر اطلاعات",
                      style: MyTextStyle().style12,
                    ),
                  ],
                ),
              ),
              Container(height: 1),
              InkWell(
                onTap: () {},
                child: Container(
                  height: Get.height * 0.08,
                  color: Colors.white,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      "خروج از حساب کاربری",
                      style: MyTextStyle().style29,
                    ),
                  ),
                ),
              )
            ],
          )),
        )
      ]),
    ));
  }

  Widget menuItem(
    String title,
    String text,
  ) {
    return Container(
      height: Get.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: MyTextStyle().style12,
          ),
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
