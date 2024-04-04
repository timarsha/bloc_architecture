import 'dart:developer';

import 'package:bloc_architecture/data/models/coin.dart';
import 'package:bloc_architecture/screens/coin/coin_screen.dart';
import 'package:bloc_architecture/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  /// The main route of the app
  static String main = '/';

  /// The record route of the app
  static String coin = 'coin';

  /// List of all routes in the app
  static List<GoRoute> routes = [
    GoRoute(
      path: main,
      name: main,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: coin,
          name: coin,
          builder: (context, state) => CoinScreen(
            coin: state.extra as Coin,
          ),
          onExit: (context) async {
            log('Exiting coin screen');
            return true;
          },
        ),
      ],
    ),
  ];
}
