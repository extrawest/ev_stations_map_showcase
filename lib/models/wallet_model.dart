class WalletModel {
  double balance;
  List<History>? history;

  WalletModel({required this.balance, this.history});

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        balance: json['balance'] as double,
        history: List<History>.from(
            json['history'].map((model) => History.fromJson(model))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? datetimeStarted;
  double? bill;
  String? datetimeFinished;
  String? stationName;
  double? consumedKwh;

  History(
      {this.datetimeStarted,
      this.bill,
      this.datetimeFinished,
      this.stationName,
      this.consumedKwh});

  factory History.fromJson(Map<String, dynamic> json) => History(
        datetimeStarted: json['datetime_started'] as String?,
        bill: json['bill'] as double?,
        datetimeFinished: json['datetime_finished'] as String?,
        stationName: json['station_name'] as String?,
        consumedKwh: json['consumed_kwh'] as double,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime_started'] = datetimeStarted;
    data['bill'] = bill;
    data['datetime_finished'] = datetimeFinished;
    data['station_name'] = stationName;
    data['consumed_kwh'] = consumedKwh;
    return data;
  }
}
