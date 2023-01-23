class RateModel {
  String? info;
  String? description;
  String? timeStampString;
  get timeStamp => int.parse(timeStampString ?? "0");

  Map<String, dynamic> rates = {};

  RateModel.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    description = json['description'];
    timeStampString = json['timestamp'];
    rates = json['rates'];
  }
}