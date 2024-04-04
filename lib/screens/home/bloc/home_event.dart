part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeGetCoinsEvent extends HomeEvent {}

class HomeRefreshCoinsEvent extends HomeEvent {}
