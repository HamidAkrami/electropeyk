import 'package:electropeyk/app/data/models/order_model.dart';
import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/point_page_details/Strengths.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/point_page_details/weak_point.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/pte_page_point_check.dart';
import 'package:electropeyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class PointToExpertPage extends StatefulWidget {
  OrderModel? orderModel;
  PointToExpertPage({
    Key? key,
  }) : super(key: key) {
    orderModel = Get.arguments;
  }

  @override
  State<PointToExpertPage> createState() => _PointToExpertPageState();
}

class _PointToExpertPageState extends State<PointToExpertPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  int selectedTab = 0;
  bool? isKeyboard;
  final homeCtrl = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController!.addListener(() {
      selectedTab = tabController!.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: SafeArea(
          child: Column(children: [
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
                          "امتیاز به متخصص",
                          textAlign: TextAlign.center,
                          style: MyTextStyle().style11,
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
            Expanded(
                child: Column(
              children: [
                isKeyboard!
                    ? Container()
                    : Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/images/aavatar.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                widget.orderModel!.expertName!,
                                style: MyTextStyle().style11,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "به متخصص خود چه امتیازی می‌دهید؟",
                                style: MyTextStyle().style12,
                              ),
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ),
                Expanded(
                    flex: 3,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.06,
                              child: TabBar(
                                  indicatorWeight: 3,
                                  indicatorColor: selectedTab == 0
                                      ? const Color(0xff34C759)
                                      : Colors.red,
                                  controller: tabController,
                                  tabs: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            selectedTab == 0
                                                ? "assets/icons/like.png"
                                                : "assets/icons/likegrey.png",
                                          ),
                                          Text("  نقاط قوت",
                                              style: selectedTab == 0
                                                  ? const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: Color(0xff34C759))
                                                  : MyTextStyle().style12)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            selectedTab == 1
                                                ? "assets/icons/disslike.png"
                                                : "assets/icons/disslikegrey.png",
                                          ),
                                          Text(
                                            "  نقاط ضعف",
                                            style: selectedTab == 1
                                                ? const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color(0xffFF3B30))
                                                : MyTextStyle().style12,
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.white,
                                  child: TabBarView(
                                      controller: tabController,
                                      children: [
                                        Strengths(),
                                        WeakPoint(),
                                      ]),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "نظر خود را بنویسید",
                                      hintStyle: MyTextStyle().style16,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff1980FF))),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xff1980FF)))),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ButtonWidget(
                                text: "ثبت امتیاز",
                                onPress: () {
                                  Get.back();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ))
          ]),
        ));
  }
}
