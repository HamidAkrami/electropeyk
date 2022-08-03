import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/electroclub/electroclub_page.dart';

import 'package:electropeyk/app/presantation/pages/home/ordering_page/ordering_page.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/orders_page.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/profile_page.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/address_page.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/address_page_details/new_address.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/profile_page_details.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/wallet_page.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/bottom_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF2F2F7),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      Obx(
                        () => controller.profilePage.value == 0
                            ? ProfilePage()
                            : controller.profilePage.value == 1
                                ? ProfilePageDetails()
                                : controller.profilePage.value == 2
                                    ? WalletPage()
                                    : controller.profilePage.value == 3
                                        ? AddressPage()
                                        : controller.profilePage.value == 4
                                            ? NewAddress(
                                                index: 4,
                                              )
                                            : controller.profilePage.value == 5
                                                ? NewAddress(
                                                    index: 5,
                                                  )
                                                : Container(),
                      ),
                      ElectroClubPage(),
                      OrdersPage(),
                      OrderingPage()
                    ],
                    onPageChanged: (page) {
                      controller.currentPageIndex.value = page;
                    },
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: Get.height * 0.085,
            decoration: const BoxDecoration(color: Colors.white),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItems(
                    selectedIndex: controller.currentPageIndex.value,
                    ontap: controller.ontapBar,
                    index: 0,
                    icon: controller.currentPageIndex.value == 0
                        ? "assets/icons/profileblue.png"
                        : "assets/icons/profile.png",
                    title: "حساب کاربری",
                  ),
                  BottomNavigationItems(
                    selectedIndex: controller.currentPageIndex.value,
                    ontap: controller.ontapBar,
                    index: 1,
                    icon: controller.currentPageIndex.value == 1
                        ? "assets/icons/electroclubblue.png"
                        : "assets/icons/electroclub.png",
                    title: "الکتروکلاب",
                  ),
                  BottomNavigationItems(
                    selectedIndex: controller.currentPageIndex.value,
                    ontap: controller.ontapBar,
                    index: 2,
                    icon: controller.currentPageIndex.value == 2
                        ? "assets/icons/ordersblue.png"
                        : "assets/icons/orders.png",
                    title: "سفارشات",
                  ),
                  BottomNavigationItems(
                    selectedIndex: controller.currentPageIndex.value,
                    ontap: controller.ontapBar,
                    index: 3,
                    icon: controller.currentPageIndex.value == 3
                        ? "assets/icons/orderblue.png"
                        : "assets/icons/order.png",
                    title: "ثبت سفارش",
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
