part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}

final class HomeCoinsLoadedState extends HomeState {
  final List<Coin> coins;

  HomeCoinsLoadedState(this.coins);
}
