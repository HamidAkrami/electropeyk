import 'package:electropeyk/app/presantation/pages/home/widgets/custom_container.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDialog extends StatelessWidget {
  String? title = "تعمیر";
  String? iconUrl = "assets/icons/repair.png";
  ProductDialog({Key? key}) : super(key: key);
  String? imageUrl = "assets/images/Rectangle.png";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          height: Get.height * 0.45,
          width: Get.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              )),
              Divider(
                thickness: 1.5,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "محصول",
                      style: MyTextStyle().style21,
                    ),
                    Text(
                      " “گوشی تصویری 10 اینچ مدل 1198”",
                      style: MyTextStyle().style22,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "چه سرویسی را برای محصول انتخابی خود در نظر دارید؟",
                style: MyTextStyle().style21,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.repairPage);
                      },
                      child: CustomContainer(
                          title: "تعمیر", iconUrl: "assets/icons/repair.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.repairPage);
                      },
                      child: CustomContainer(
                          title: "نصب", iconUrl: "assets/icons/install.png"),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
