import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool? dropDown = false.obs;
  RxBool? isAgree = false.obs;
  RxDouble? height = 0.0.obs;
  RxBool? warningVisible = true.obs;
  RxString? selectedCity = "شهر خود را انتخاب کنید".obs;
  TextEditingController userNameController = TextEditingController();
  RxString? userName = "".obs;
  final cityList = <String>[
    "تهران",
    "اصفهان",
    "البرز",
    "تبریز",
    "شیراز",
    "مشهد",
    "ارومیه",
    "اهواز"
  ];
}
