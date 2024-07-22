import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/counter/counter.dart';
import 'package:getx_state_management/quiz/view/quiz_screen.dart';
import 'package:getx_state_management/theme/theme_controller.dart';
import 'package:getx_state_management/todo/view/home.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'api_calling/view/home_screen.dart';
import 'form/signup.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        theme:
            themeController.isDark.value ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: QuizScreen(),
      ),
    );
  }
}
