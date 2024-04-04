import 'dart:convert';

class Coin {
  final String? id;
  final String? rank;
  final String? symbol;
  final String? name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;
  Coin({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "rank": rank,
      "symbol": symbol,
      "name": name,
      "supply": supply,
      "maxSupply": maxSupply,
      "marketCapUsd": marketCapUsd,
      "volumeUsd24Hr": volumeUsd24Hr,
      "priceUsd": priceUsd,
      "changePercent24Hr": changePercent24Hr,
      "vwap24Hr": vwap24Hr,
      "explorer": explorer,
    };
  }

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      id: map["id"],
      rank: map["rank"],
      symbol: map["symbol"],
      name: map["name"],
      supply: map["supply"],
      maxSupply: map["maxSupply"],
      marketCapUsd: map["marketCapUsd"],
      volumeUsd24Hr: map["volumeUsd24Hr"],
      priceUsd: map["priceUsd"],
      changePercent24Hr: map["changePercent24Hr"],
      vwap24Hr: map["vwap24Hr"],
      explorer: map["explorer"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) => Coin.fromMap(json.decode(source));
}
