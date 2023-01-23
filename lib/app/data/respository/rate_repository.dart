import 'dart:convert';
import 'dart:io';

import 'package:currency_exchange/app/data/model/rate_model.dart';
import 'package:currency_exchange/app/data/model/result.dart';
import 'package:currency_exchange/app/data/provider/api.dart';
import 'package:currency_exchange/app/pages/home_/home_page_controller.dart';

class RateRepository {
  //This is dummy repository
  final APIService _apiService = APIService();
  RateRepository();

  Future<Result> getRates() async {
    //Decide where to fetch data : Local DB manager or API
    var _path = "/api/latest";
    var params = {};
    try {
      final response = await _apiService.request(
        requestType: RequestType.GET,
        path: _path,
        // parameter: params,
        header: {
          HttpHeaders.acceptHeader: 'application/json',
          // HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      final responseJSON = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var rate = RateModel.fromJson(responseJSON);
        return Result<RateModel>.success(rate);
      } else {
        var message = responseJSON["message"];
        // var message = "Getting Issue Order Failed";
        return Result.error(message);
      }
    } catch (error) {
      return Result.error("Error");
    }
  }
}
