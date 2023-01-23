import 'package:currency_exchange/app/pages/home_/home_page.dart';
import 'package:currency_exchange/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
    )
    ];
    }