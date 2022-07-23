import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(initialPage: 3);
  RxInt currentPageIndex = 3.obs;

  ontapBar(int value) {
    currentPageIndex.value = value;
    pageController.jumpToPage(
      value,
      // duration: const Duration(milliseconds: 300),
      // curve: Curves.ease,
    );
  }
}
