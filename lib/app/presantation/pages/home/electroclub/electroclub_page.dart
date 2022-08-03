import 'package:electropeyk/app/presantation/pages/home/electroclub/widgets/electro_club_app_bar.dart';
import 'package:electropeyk/app/presantation/pages/home/electroclub/widgets/electro_club_page_widget.dart';
import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectroClubPage extends StatelessWidget {
  const ElectroClubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: Column(
        children: [
          Container(
            color: Color(0xffffffff),
            height: Get.height * 0.1,
            child: ElectroClubAppBar(),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: [
                ElectroClubPageWidget(
                  image: "assets/images/learning.png",
                  title: "آموزش نصب محصولات",
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: Get.height * 0.48,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: ElectroClubPageWidget(
                                image: "assets/images/catalog.png",
                                title: "کاتالوگ محصولات",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ElectroClubPageWidget(
                                image: "assets/images/questions.png",
                                title: "سوالات متداول",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElectroClubPageWidget(
                          image: "assets/images/guarantee.png",
                          title: "شرایط گارانتی",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElectroClubPageWidget(
                  image: "assets/images/Chatsupport.png",
                  title: "پیگیری شکایت مشتریان",
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
