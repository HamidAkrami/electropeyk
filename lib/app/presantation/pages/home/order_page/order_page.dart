import 'package:electropeyk/app/presantation/pages/home/order_page/order_page_details/app_bar.dart';
import 'package:electropeyk/app/presantation/pages/home/order_page/order_page_details/product_listview.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5EA),
      appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Color(0xfffffffff),
          automaticallyImplyLeading: false,
          toolbarHeight: Get.height * 0.1,
          title: MyAppBar()),
      body: Container(
        height: Get.height,
        child: ListView(
          children: [
            ProductListview(title: "گوشی صوتی"),
            ProductListview(title: "گوشی تصویری"),
            ProductListview(title: "زنگ"),
            ProductListview(title: "گوشی صوتی"),
            ProductListview(title: "گوشی تصویری"),
          ],
        ),
      ),
    );
  }
}
