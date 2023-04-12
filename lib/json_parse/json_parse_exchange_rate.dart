import 'dart:convert';

ExchangeRate exchangeRateFromJson(String str) =>
    ExchangeRate.fromJson(json.decode(str));

String exchangeRateToJson(ExchangeRate data) => json.encode(data.toJson());

class ExchangeRate {
  ExchangeRate({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  bool? success;
  int? timestamp;
  String? base;
  DateTime? date;
  Rates? rates;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
        success: json["success"],
        timestamp: json["timestamp"],
        base: json["base"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        rates: json["rates"] == null ? null : Rates.fromJson(json["rates"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "timestamp": timestamp,
        "base": base,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "rates": rates?.toJson(),
      };
}

class Rates {
  Rates({
    this.usd,
    this.thb,
    this.eur,
  });

  double? usd;
  double? thb;
  double? eur;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        usd: json["USD"]?.toDouble(),
        thb: json["THB"]?.toDouble(),
        eur: json["EUR"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd,
        "THB": thb,
        "EUR": eur,
      };
}
