import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/wallet_page_widgets/tx_widgets.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/wallet_page_widgets/wallet_button.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.18,
            color: Color(0xff1980FF),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Get.height * 0.09,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: Get.height * 0.09 - Get.width * 0.33 / 2,
                  right: Get.width / 2 - Get.width * 0.165,
                  child: Container(
                    height: Get.width * 0.33,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/aavatar.png",
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    top: Get.width * 0.06,
                    left: Get.width * 0.05,
                    child: InkWell(
                      onTap: () {
                        homeCtrl.profilePage.value = 0;
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text("کیف پول",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: Get.height * 0.08,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          "27,000 ",
                          style: MyTextStyle().style1,
                        ),
                        Text(
                          "تومان",
                          style: MyTextStyle().style1,
                        )
                      ],
                    ),
                  ),
                ),
                Text("موجودی", style: MyTextStyle().style16),
              ],
            ),
          ),
          Container(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            height: Get.height * 0.08,
            color: Colors.white,
            child: Row(
              children: [
                WalletButton(
                  icon: "assets/icons/arrowup.png",
                  title: "واریز",
                  ontap: () {
                    print("واریز");
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                WalletButton(
                  icon: "assets/icons/arrowdown.png",
                  title: "برداشت",
                  ontap: () {
                    print("برداشت");
                  },
                ),
              ],
            ),
          ),
          Container(height: 1),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(10),
            height: Get.height * 0.06,
            child: Text(
              "تراکنش ها",
              textAlign: TextAlign.right,
              style: MyTextStyle().style30,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(height: 1),
              TxWidget(
                title: "پرداخت متخصص",
                amount: "-27,000",
                followUp: "16231261316323",
              ),
              Container(height: 1),
              TxWidget(
                title: "واریز",
                amount: "27,000",
                followUp: "16231261316323",
              ),
              Container(height: 1),
              TxWidget(
                title: "برداشت",
                amount: "-27,000",
                followUp: "16231261316323",
              ),
              Container(height: 1),
              TxWidget(
                title: "واریز",
                amount: "89,000",
                followUp: "16231261316323",
              )
            ],
          ))
        ],
      ),
    ));
  }
}
