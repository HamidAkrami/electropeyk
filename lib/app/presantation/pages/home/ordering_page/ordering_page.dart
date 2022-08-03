import 'package:electropeyk/app/presantation/pages/home/ordering_page/ordering_page_details/app_bar.dart';
import 'package:electropeyk/app/presantation/pages/home/ordering_page/ordering_page_details/product_listview.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderingPage extends StatelessWidget {
  const OrderingPage({Key? key}) : super(key: key);

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
