import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({Key? key}) : super(key: key);
  String? imageUrl = "assets/images/Rectangle.png";
  String? title = "تصویری 10 اینچ مدل 1198";
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: Get.height * 0.2,
        width: Get.height * 0.18,
        decoration: BoxDecoration(
          color: Color(0xfffffffff),
        ),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imageUrl!,
                fit: BoxFit.cover,
              ),
            )),
            Divider(thickness: 1.2),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  title!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: MyTextStyle().style17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
