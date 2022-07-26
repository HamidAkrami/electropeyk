import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/use_case.dart';
import '../../domain/use_cases/setting/language/get_language_use_case.dart';
import '../../domain/use_cases/setting/language/set_language_use_case.dart';
import '../../domain/use_cases/setting/theme/get_theme_mode_use_case.dart';
import '../../domain/use_cases/setting/theme/set_theme_mode_use_case.dart';

class SettingController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  RxBool isDark = false.obs;
  RxBool isEn = true.obs;
  GetThemeModeUseCase getThemeModeUseCase = Get.find();
  SetThemeModeUseCase setThemeModeUseCase = Get.find();

  SetLanguageUseCase setLanguageUseCase = Get.find();
  GetLanguageUseCase getLanguageUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();

    getThemeModeUseCase.call(NoParams()).then((response) {
      if (response.isRight) {
        isDark.value = response.right;
        Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
      } else if (response.isLeft) {
        // CacheException
        print("CacheException");
      }
    });
    getLanguageUseCase.call(NoParams()).then((response) {
      if (response.isRight) {
        isEn.value = response.right;
      } else if (response.isLeft) {
        // CacheException
        print("CacheException");
      }
    });
  }

  toggleLanguage() {
    isEn.value = !isEn.value;
    Get.updateLocale(
        isEn.value ? const Locale('en', 'US') : const Locale('fa', 'IR'));
    setLanguageUseCase.call(Params(boolValue: isEn.value));
  }

  toggleTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
    setThemeModeUseCase.call(Params(boolValue: isDark.value));
  }
}
