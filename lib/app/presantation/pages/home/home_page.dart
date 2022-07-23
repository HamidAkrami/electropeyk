import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/order_page/order_page.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/bottom_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffE5E5EA),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            height: 500,
                            width: 300,
                            color: Colors.blue,
                            child: Text(
                              "page1",
                              style: TextStyle(fontSize: 50),
                            )),
                      ),
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            height: 500,
                            width: 300,
                            color: Colors.red,
                            child: Text(
                              "page2",
                              style: TextStyle(fontSize: 50),
                            )),
                      ),
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            height: 500,
                            width: 300,
                            color: Colors.amber,
                            child: Text(
                              "page3",
                              style: TextStyle(fontSize: 50),
                            )),
                      ),
                      OrderPage()
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
            padding: EdgeInsets.symmetric(vertical: 5),
            height: Get.height * 0.085,
            decoration: BoxDecoration(color: Colors.white),
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
