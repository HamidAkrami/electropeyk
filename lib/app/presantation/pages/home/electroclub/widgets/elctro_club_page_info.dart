import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectroClubPageInfo extends StatelessWidget {
  ElectroClubPageInfo({Key? key});
  String? title;

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments[0];
    String image = Get.arguments[1];

    return Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: SafeArea(
            child: Column(
          children: [
            Card(
              elevation: 0.5,
              child: Container(
                  height: Get.height * 0.1,
                  color: Color(0xffffffff),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: MyTextStyle().style12,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "بازگشت",
                                style: MyTextStyle().style20,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff1980FF),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )),
            ),
            Container(
              height: Get.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(image),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
            ))
          ],
        )));
  }
}
