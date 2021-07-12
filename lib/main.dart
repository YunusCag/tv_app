import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';
import 'package:tv_app/core/init/theme/theme_service.dart';
import 'package:tv_app/view/home/bindings/home_binding.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/init/routes/app_pages.dart';

void main() async {
  await LocalStorageService.instance.initializeHive();

  runApp(TVApp());
}

class TVApp extends StatelessWidget {
  const TVApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return ScreenUtilInit(
      designSize: Size(393,808),
      builder: ()=>GetMaterialApp(
        title: "TV App",
        enableLog: true,
        translations: LocalizationService.instance,
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        initialRoute: AppPages.INITIAL,
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        getPages: AppPages.routes,
        theme: ThemeService.instance.light,

      ),
    );
  }
}
