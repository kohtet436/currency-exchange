import 'package:currency_exchange/app/data/respository/repository.dart';
import 'package:currency_exchange/app/pages/home_/home_page_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(repository: Repository()));

  }
}
