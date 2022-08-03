import 'dart:ui';

import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoOrderWidget extends StatelessWidget {
  TodoOrderWidget(
      {Key? key,
      this.image,
      this.productName,
      this.expertName,
      this.status,
      this.followUpCode,
      this.time})
      : super(key: key);
  String? image;
  String? productName;
  String? expertName;
  String? time;
  int? status = 0;
  int? followUpCode;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: Get.height * 0.2,
        width: Get.width,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Color(0xffE5E5EA))),
                  child: Image.asset(
                    image!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            " محصول  ",
                            style: MyTextStyle().style17,
                          ),
                          Text(productName!, style: MyTextStyle().style28)
                        ],
                      ),
                      status == 0
                          ? Row(
                              children: [
                                Text(
                                  ":وضعیت",
                                  style: MyTextStyle().style17,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "در حال جستجوی متخصص",
                                  style: MyTextStyle().style23,
                                )
                              ],
                            )
                          : status == 1
                              ? Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(expertName!,
                                        style: MyTextStyle().style28)
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text("وضعیت", style: MyTextStyle().style17),
                                    Text(
                                      "لغو",
                                      style: MyTextStyle().style24,
                                    )
                                  ],
                                ),
                      Row(
                        children: [
                          Text("کد پیگیری:", style: MyTextStyle().style17),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${followUpCode}", style: MyTextStyle().style28)
                        ],
                      ),
                      Row(children: [
                        Text("زمان", style: MyTextStyle().style17),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          time!,
                          style: MyTextStyle().style28,
                        )
                      ]),
                      status == 2
                          ? Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffFF3B30).withOpacity(0.1),
                              ),
                              child: Text(
                                "لغو سفارش",
                                style: MyTextStyle().style26,
                              ))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: status == 0
                                          ? Color(0xffFFCC00).withOpacity(0.1)
                                          : Color(0xff34C759).withOpacity(0.1)),
                                  child: Text(
                                    status == 0
                                        ? "در حال جستجو"
                                        : "متخصص پیدا شد",
                                    style: status == 0
                                        ? MyTextStyle().style23
                                        : MyTextStyle().style25,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "لغو سفارش",
                                    textAlign: TextAlign.center,
                                    style: MyTextStyle().style26,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
