import 'dart:io';
import 'package:currency_exchange/app/data/model/rate_model.dart';
import 'package:currency_exchange/app/data/model/result.dart';
import 'package:currency_exchange/app/data/respository/rate_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

class RateController extends GetxController {
  //Initialised properties  --------------------------------------
  RateRepository _rateRepository = RateRepository();
  RateController();

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------
  var _isLoading = false.obs;

  //Getters
  get isLoading => _isLoading.value;

  //Setters -------------------------------------------------------

  onInit() {
    super.onInit();

    //Controller Initialization
  }

  //Public Methods ( Functions) -----------------------------------
  Future<RateModel?> getRates() async {
    RateModel? rate;
    var result = await _rateRepository.getRates();
    if (result is SuccessState) {
      var rate = result.value;
      return rate;
      //Fetch user information again

    } else if (result is ErrorState) {
      _isLoading.value = false;
      return rate;
    } else if (result is LoadingState) {
      _isLoading.value = true;
    }
    return rate;
  }

  //Private Methods ( used internally ) ---------------------------
}