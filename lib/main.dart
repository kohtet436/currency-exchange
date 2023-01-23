import 'package:currency_exchange/app/binding/home_binding.dart';
import 'package:currency_exchange/app/pages/home_/home_page.dart';
import 'package:currency_exchange/app/routes/app_pages.dart';
import 'package:currency_exchange/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: HomeBinding(),
      initialRoute: Routes.homePage,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
