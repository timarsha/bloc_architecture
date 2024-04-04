import 'package:bloc_architecture/data/extensions.dart';
import 'package:bloc_architecture/data/models/coin.dart';
import 'package:flutter/material.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          coin.name ?? '',
          style: context.titleStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${coin.priceUsd?.formatPrice} \$',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: context.greenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
