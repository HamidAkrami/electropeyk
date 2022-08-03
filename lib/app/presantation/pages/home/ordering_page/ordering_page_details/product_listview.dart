import 'package:electropeyk/app/presantation/pages/home/widgets/product_dialog.dart';
import 'package:electropeyk/app/presantation/pages/home/widgets/product_widget.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListview extends StatelessWidget {
  ProductListview({Key? key, this.title}) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: Get.height * 0.28,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 13,
                    color: Color(0xff1980FF),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.allProductPage, arguments: title);
                    },
                    child: Text(
                      "مشاهده همه",
                      style: MyTextStyle().style18,
                    ),
                  )
                ],
              ),
              Text(
                title!,
                style: MyTextStyle().style19,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        openDialog();
                      },
                      child: ProductWidget());
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  openDialog() {
    Get.dialog(ProductDialog());
    // showDialog(
    //     context: context,
    //     builder: (_) => AlertDialog(
    //           insetPadding: EdgeInsets.all(20),
    //           content: ProductDialog(),
    //         ));
  }
}
