import 'dart:async';

import 'package:bloc_architecture/data/models/coin.dart';
import 'package:bloc_architecture/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Variables
  final HomeRepository homeRepo;
  final List<Coin> _coins = [];
  late ScrollController scrollController;
  int _page = 1;
  bool _isLoading = false;

  // Constructor
  HomeBloc({required this.homeRepo}) : super(HomeInitialState()) {
    on<HomeInitEvent>(_homeInitEvent);
    on<HomeGetCoinsEvent>(_homeGetCoins);
    on<HomeRefreshCoinsEvent>(_homeRefreshCoins);
    _init();
  }

  /// Initialize
  void _init() {
    add(HomeInitEvent());
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels > (scrollController.position.maxScrollExtent - 100) && !_isLoading) {
        _isLoading = true;
        add(HomeGetCoinsEvent());
      }
    });
  }

  /// Initialize data
  FutureOr<void> _homeInitEvent(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final resp = await homeRepo.getCoins(_page);
    if (resp.data != null) {
      _coins.addAll(resp.data!);
      _page++;
      emit(HomeCoinsLoadedState(_coins));
    } else {
      emit(HomeErrorState(resp.error!));
    }
  }

  /// Get coins
  FutureOr<void> _homeGetCoins(HomeGetCoinsEvent event, Emitter<HomeState> emit) async {
    final resp = await homeRepo.getCoins(_page);
    if (resp.data != null) {
      _coins.addAll(resp.data!);
      _page++;
      _isLoading = false;
      emit(HomeCoinsLoadedState(_coins));
    } else {
      emit(HomeErrorState(resp.error!));
    }
  }

  /// Refresh screen
  FutureOr<void> _homeRefreshCoins(HomeRefreshCoinsEvent event, Emitter<HomeState> emit) async {
    final resp = await homeRepo.getCoins(1);
    if (resp.data != null) {
      _coins.clear();
      _coins.addAll(resp.data!);
      _page++;
      emit(HomeCoinsLoadedState(_coins));
    } else {
      emit(HomeErrorState(resp.error!));
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
