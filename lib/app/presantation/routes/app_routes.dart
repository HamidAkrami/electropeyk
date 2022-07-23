import 'package:electropeyk/app/presantation/bindings/home_page_binding.dart';
import 'package:electropeyk/app/presantation/bindings/sign_up_binding.dart';
import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/order_page/all_products_page.dart';
import 'package:electropeyk/app/presantation/pages/login/login_page.dart';
import 'package:electropeyk/app/presantation/pages/login/verification_page.dart';
import 'package:electropeyk/app/presantation/pages/sign_up_page/sign_up_page.dart';
import 'package:electropeyk/app/presantation/pages/splash_screen/splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../bindings/login_page_binding.dart';
import '../bindings/main_binding.dart';
import '../bindings/setting_page_binding.dart';
import '../pages/home/home_page.dart';

import '../pages/setting/setting_page.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String settingPage = "/settingPage";
  static const String splashScreen = "/splashPage";
  static const String loginPage = "/loginPage";
  static const String verificationPage = "/verificationPage";
  static const String signUpPage = "/signUpPage";
  static const String allProductPage = "/allProductPage";
}

class App {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: AppRoutes.loginPage,
        transition: Transition.circularReveal,
        curve: Curves.linear,
        page: () => const LoginPage(),
        binding: LoginPageBinding()),
    GetPage(
        name: AppRoutes.homePage,
        page: () => HomePage(),
        binding: HomePageBinding()),
    GetPage(
      name: AppRoutes.verificationPage,
      page: () => const VerificationPage(),
    ),
    GetPage(
        name: AppRoutes.signUpPage,
        page: () => SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.settingPage,
        page: () => const SettingPage(),
        bindings: [MainBinding(), SettingPageBinding()]),
    GetPage(
      name: AppRoutes.allProductPage,
      page: () => AllProductPage(),
    ),
  ];
}
