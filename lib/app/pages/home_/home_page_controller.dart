import 'package:currency_exchange/app/controller/rate_controller.dart';
import 'package:currency_exchange/app/data/model/rate_model.dart';
import 'package:currency_exchange/app/data/respository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  //Initialised properties  --------------------------------------
  final Repository repository;

  HomeController({required this.repository}) : assert(repository != null);

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE
  RateModel? rate;
  //Private -------------------------------------------------------

  final _isLoading = false.obs;

  //Getters
  get isLoading => _isLoading.value;

  //Setters -------------------------------------------------------
  set isLoading(value) => _isLoading.value = value;
  RateController rateCtrl = Get.put(RateController());
  final Rx<String> _dropvalue = ''.obs;
  String get dropvalue => _dropvalue.value;
  set dropvalue(val) => _dropvalue.value = val;

  var textController = TextEditingController();

  var answer = 0.0.obs;
  void convertMoney(money) {
    if (mmkForm?.currentState?.validate() != true) return;
    var moneyFormat = money.replaceAll(",", "");
    var data = double.parse(moneyFormat ?? "0");
    answer.value = int.parse(textController.text) / data;
  }

  GlobalKey<FormState>? mmkForm = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    isLoading = true;
    _fetchRate();
  }

  String formatTimestamp(timestamp) {
    var format = DateFormat('EEE, M/d/y');

    return format.format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  //Public Methods ( Functions) -----------------------------------

  //Private Methods ( used internally ) ---------------------------
  _fetchRate() async {
    var rate = await rateCtrl.getRates();
    if (rate != null) {
      print("Got the rate");
      print(rate);
      this.rate = rate;
    } else {
      print("Sorry no the rate");
    }
    isLoading = false;
  }
  //Public Methods  ( Routing : start with to) --------------------

}
