import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/orders_page_app_bar.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/todo_orders_widget.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: Column(
        children: [
          Container(
            color: Color(0xffffffff),
            height: Get.height * 0.1,
            child: OrdersPageAppBar(),
          ),
          homeCtrl.todoOrders.isEmpty
              ? Expanded(
                  child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "!سفارشی یافت نشد",
                        style: MyTextStyle().style2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/images/empty.png")
                    ],
                  ),
                ))
              : Expanded(
                  child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "سفارش های جاری",
                        textAlign: TextAlign.right,
                        style: MyTextStyle().style27,
                      ),
                    ),
                    ...homeCtrl.doingOrders.map((e) => e.status == 1
                        ? InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.pointToExpertPage,
                                  arguments: e);
                            },
                            child: TodoOrderWidget(
                              image: e.image,
                              productName: e.productName,
                              status: e.status,
                              expertName: e.expertName,
                              followUpCode: e.followUpCode,
                              time: e.time,
                            ),
                          )
                        : TodoOrderWidget(
                            image: e.image,
                            productName: e.productName,
                            status: e.status,
                            expertName: e.expertName,
                            followUpCode: e.followUpCode,
                            time: e.time,
                          )),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "سفارش های پیشین",
                        textAlign: TextAlign.right,
                        style: MyTextStyle().style27,
                      ),
                    ),
                    ...homeCtrl.lastOrders.map((e) => TodoOrderWidget(
                          image: e.image,
                          productName: e.productName,
                          status: e.status,
                          expertName: e.expertName,
                          followUpCode: e.followUpCode,
                          time: e.time,
                        ))
                  ],
                )),
        ],
      ),
    );
  }
}
