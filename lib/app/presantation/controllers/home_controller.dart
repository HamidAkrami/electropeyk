import 'package:electropeyk/app/data/models/order_model.dart';
import 'package:electropeyk/app/presantation/pages/home/orders_page/widgets/pte_page_point_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jalali_table_calendar/jalali_table_calendar.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addtolist();
  }

  PageController pageController = PageController(initialPage: 3);
  RxInt currentPageIndex = 3.obs;
  RxBool buttonDisable = false.obs;
  RxBool isMine = true.obs;
  RxBool isRepair = false.obs;
  RxBool newAddress = false.obs;
  RxBool pointCheckBox1 = false.obs;
  RxBool pointCheckBox2 = false.obs;
  RxBool pointCheckBox3 = false.obs;
  RxBool pointCheckBox4 = false.obs;
  RxBool pointCheckBox5 = false.obs;
  RxBool pointCheckBox6 = false.obs;
  RxBool pointCheckBox7 = false.obs;
  RxBool pointCheckBox8 = false.obs;
  RxBool pointCheckBox9 = false.obs;
  RxBool pointCheckBox10 = false.obs;
  RxBool boxValue = false.obs;
  RxBool isEdit = false.obs;
  RxDouble height = 0.0.obs;
  RxString? selectedAddress = "خونه بابا اینا".obs;
  RxString? selectedCity = "انتخاب شهر".obs;
  RxString sex = "مرد".obs;
  RxString userName = "ممد توتون".obs;
  RxString userEmail = "m.toton@gmail.com".obs;
  RxString userBirthDay = "1364/5/01".obs;
  RxInt profilePage = 0.obs;
  RxString selectedDate = "".obs;

  TextEditingController timeFromController = TextEditingController();
  TextEditingController timeToController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController plaqueController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController profileName = TextEditingController();
  TextEditingController profileEmail = TextEditingController();
  TextEditingController profilebirthDateyear = TextEditingController();
  TextEditingController profilebirthDatemonth = TextEditingController();
  TextEditingController profilebirthDateday = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  FocusNode birthfocus1 = FocusNode();
  FocusNode birthfocus2 = FocusNode();
  FocusNode birthfocus3 = FocusNode();

  RxList<String> address = [
    "خونه خودمون",
    "خونه بابا",
    "شرکت",
    "دفتر ولیعصر",
    "افزودن آدرس",
  ].obs;
  removeAddress(item) {
    address.remove(item);
    refresh();
  }

  final List<String> choiceCity = [];
  final List<OrderModel> todoOrders = [
    OrderModel(
        image: "assets/images/Rectangle.png",
        expertName: "ممد توتون",
        productName: "گوشی صوتی مستقل همراه تصویری",
        followUpCode: 1234567890,
        status: 0,
        time: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00"),
    OrderModel(
        image: "assets/images/Rectangle.png",
        expertName: "ممد توتون",
        productName: "گوشی صوتی مستقل همراه تصویری",
        followUpCode: 1234567890,
        status: 1,
        time: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00"),
    OrderModel(
        image: "assets/images/Rectangle.png",
        expertName: "ممد توتون",
        productName: "گوشی صوتی مستقل همراه تصویری",
        followUpCode: 1234567890,
        status: 0,
        time: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00"),
    OrderModel(
        image: "assets/images/Rectangle.png",
        expertName: "ممد توتون",
        productName: "گوشی صوتی مستقل همراه تصویری",
        followUpCode: 1234567890,
        status: 2,
        time: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00"),
    OrderModel(
        image: "assets/images/Rectangle.png",
        expertName: "ممد توتون",
        productName: "گوشی صوتی مستقل همراه تصویری",
        followUpCode: 1234567890,
        status: 2,
        time: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00"),
    OrderModel(
        image: "assets/images/Rectangle.png",
        expertName: "ممد توتون",
        productName: "گوشی صوتی مستقل همراه تصویری",
        followUpCode: 1234567890,
        status: 2,
        time: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00"),
  ];
  List<OrderModel> doingOrders = [];
  List<OrderModel> lastOrders = [];

  ontapBar(int value) {
    currentPageIndex.value = value;
    pageController.jumpToPage(
      value,
      // duration: const Duration(milliseconds: 300),
      // curve: Curves.ease,
    );
  }

  addtolist() {
    for (var i = 0; i < todoOrders.length; i++) {
      if (todoOrders[i].status == 0 || todoOrders[i].status == 1) {
        doingOrders.add(todoOrders[i]);
      } else if (todoOrders[i].status == 2) {
        lastOrders.add(todoOrders[i]);
      }
    }
  }

  onCheck(CheckItem item) {
    switch (item.index) {
      case 0:
        pointCheckBox1.value = item.value!;
        break;
      case 1:
        pointCheckBox2.value = item.value!;
        break;
      case 2:
        pointCheckBox3.value = item.value!;
        break;
      case 3:
        pointCheckBox4.value = item.value!;
        break;
      case 4:
        pointCheckBox5.value = item.value!;
        break;
      case 5:
        pointCheckBox6.value = item.value!;
        break;
      case 6:
        pointCheckBox7.value = item.value!;
        break;
      case 7:
        pointCheckBox8.value = item.value!;
        break;
      case 8:
        pointCheckBox9.value = item.value!;
        break;

      case 9:
        pointCheckBox10.value = item.value!;
        break;

      default:
    }
  }
}
