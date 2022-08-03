import 'package:electropeyk/app/presantation/bindings/home_page_binding.dart';
import 'package:electropeyk/app/presantation/bindings/sign_up_binding.dart';
import 'package:electropeyk/app/presantation/controllers/login_controller.dart';
import 'package:electropeyk/app/presantation/pages/home/electroclub/widgets/elctro_club_page_info.dart';

import 'package:electropeyk/app/presantation/pages/home/ordering_page/all_products_page.dart';
import 'package:electropeyk/app/presantation/pages/home/ordering_page/repair_page/repair_page.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/point_to_expert_page.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/profile_page_details.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/suport_page.dart';
import 'package:electropeyk/app/presantation/pages/home/profile_page/widgets/wallet_page.dart';

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
  static const String repairPage = "/repairPage";
  static const String pointToExpertPage = "/pointToExpertPage";
  static const String electroClubPageInfo = "/electroClubPageInfo";
  static const String profilePageDetails = "/profilePageDetails";
  static const String walletPage = "/walletPage";
  static const String suportPage = "/suportPage";
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
        bindings: [HomePageBinding(), SignUpBinding()]),
    GetPage(
      name: AppRoutes.verificationPage,
      page: () => const VerificationPage(),
    ),
    GetPage(
        name: AppRoutes.signUpPage,
        page: () => SignUpPage(),
        bindings: [SignUpBinding(), HomePageBinding()]),
    GetPage(
        name: AppRoutes.settingPage,
        page: () => const SettingPage(),
        bindings: [MainBinding(), SettingPageBinding()]),
    GetPage(
      name: AppRoutes.allProductPage,
      page: () => AllProductPage(),
    ),
    GetPage(
        name: AppRoutes.repairPage,
        page: () => RepairPage(),
        bindings: [SignUpBinding(), HomePageBinding()]),
    GetPage(
      name: AppRoutes.pointToExpertPage,
      page: () => PointToExpertPage(),
    ),
    GetPage(
      name: AppRoutes.electroClubPageInfo,
      page: () => ElectroClubPageInfo(),
    ),
    GetPage(
      name: AppRoutes.suportPage,
      page: () => SupportPage(),
    ),
  ];
}
