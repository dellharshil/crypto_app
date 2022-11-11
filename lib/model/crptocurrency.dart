// To parse this JSON data, do
//
//     final sample = sampleFromJson(jsonString);

import 'dart:convert';

Sample sampleFromJson(String str) => Sample.fromJson(json.decode(str));

String sampleToJson(Sample data) => json.encode(data.toJson());

class Sample {
  Sample({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.circulatingSupply,
    required this.ath,
    required this.atl,
    required this.lastUpdated,
  });

  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double marketCap;
  double marketCapRank;
  double high24H;
  double low24H;
  double priceChange24H;
  double priceChangePercentage24H;
  double circulatingSupply;
  double ath;
  double atl;
  DateTime lastUpdated;
  bool favorite=false;

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    image: json["image"],
    currentPrice: double.parse(json["current_price"].toString()),
    marketCap: double.parse(json["market_cap"].toString()),
    marketCapRank: double.parse(json["market_cap_rank"].toString()),
    high24H: double.parse(json["high_24h"].toString()),
    low24H: double.parse(json["low_24h"].toString()),
    priceChange24H: double.parse(json["price_change_24h"].toString()),
    priceChangePercentage24H: double.parse(json["price_change_percentage_24h"].toDouble().toString()),
    circulatingSupply: double.parse(json["circulating_supply"].toString()),
    ath: double.parse(json["ath"].toString()),
    atl: json["atl"].toDouble(),
    lastUpdated: DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "image": image,
    "current_price": currentPrice,
    "market_cap": marketCap,
    "market_cap_rank": marketCapRank,
    "high_24h": high24H,
    "low_24h": low24H,
    "price_change_24h": priceChange24H,
    "price_change_percentage_24h": priceChangePercentage24H,
    "circulating_supply": circulatingSupply,
    "ath": ath,
    "atl": atl,
    "last_updated": lastUpdated.toIso8601String(),
  };
}
