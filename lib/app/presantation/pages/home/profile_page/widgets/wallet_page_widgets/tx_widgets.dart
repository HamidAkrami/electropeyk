import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxWidget extends StatelessWidget {
  TxWidget({Key? key, this.amount, this.followUp, this.title})
      : super(key: key);
  String? amount;
  String? title;
  String? followUp;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      height: Get.height * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "تومان",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: title == "پرداخت متخصص"
                            ? Color(0xffFF3B30)
                            : title == "برداشت"
                                ? Color(0xffFF3B30)
                                : Color(0xff34C759)),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    amount!,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: title == "پرداخت متخصص"
                            ? Color(0xffFF3B30)
                            : title == "برداشت"
                                ? Color(0xffFF3B30)
                                : Color(0xff34C759)),
                  ),
                ],
              ),
              Text(
                title!,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: title == "پرداخت متخصص"
                        ? Color(0xffFF3B30)
                        : title == "برداشت"
                            ? Color(0xffFF3B30)
                            : Color(0xff34C759)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                followUp!,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xff1F1F24).withOpacity(0.5)),
              ),
              Text(
                ": کد پیگیری",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xff1F1F24).withOpacity(0.5)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
