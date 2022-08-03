import 'package:electropeyk/app/presantation/pages/home/widgets/order_app_bar.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductPage extends StatelessWidget {
  AllProductPage({Key? key}) : super(key: key) {
    title = Get.arguments;
  }
  String? title;
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
            title: title,
          )),
      body: GridView.builder(
          padding: EdgeInsets.all(12),
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            return ProductWidget();
          }),
    );
  }
}
