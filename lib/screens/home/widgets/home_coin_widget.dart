import 'package:bloc_architecture/data/extensions.dart';
import 'package:bloc_architecture/data/models/coin.dart';
import 'package:bloc_architecture/data/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCoinWidget extends StatelessWidget {
  const HomeCoinWidget({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        coin.name ?? "",
        style: context.titleStyle,
      ),
      subtitle: Text(
        coin.symbol ?? "",
        style: context.subtitleStyle,
      ),
      trailing: Text(
        '${coin.priceUsd?.formatPrice} \$',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: context.greenColor,
        ),
      ),
      onTap: () {
        context.goNamed(
          AppRoutes.coin,
          extra: coin,
        );
      },
    );
  }
}
